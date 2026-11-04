import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194
import Grothe.UpperChaos.OriginalRow227TriangleForward1960
import Grothe.UpperChaos.OriginalRow227TriangleForward1961
import Grothe.UpperChaos.OriginalRow227TriangleForward1962
import Grothe.UpperChaos.OriginalRow227TriangleForward1963

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1960 : OriginalRow227TriangleForward1960.entries.size = 32 := rfl

def entry1960 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1960.entries[i.val]'(by rw [size1960]; exact i.isLt)

theorem fields1960 (i : Fin 32) :
    (entry1960 i).IA = shift ∧ (entry1960 i).ID = S (193 + i.val + 1) ∧
      (entry1960 i).IC = S 194 ∧ (entry1960 i).Inext = T 193 (193 + i.val + 1) ∧
      (entry1960 i).Icur = T 193 (193 + i.val) ∧
      (entry1960 i).output = T 194 (193 + i.val) ∧
      (entry1960 i).charge = charge 193 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1960 (i : Fin 32) :
    forwardStepOK (-768) (charge 193 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 194) (T 193 (193 + i.val + 1))
      (T 193 (193 + i.val)) (T 194 (193 + i.val))
      (OriginalRow227Roots.root_pos 194 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 193 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1960.entries OriginalRow227TriangleForward1960.checked
    ⟨i.val, by rw [size1960]; exact i.isLt⟩
  change (entry1960 i).check = true at h
  rcases fields1960 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1961 : OriginalRow227TriangleForward1961.entries.size = 32 := rfl

def entry1961 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1961.entries[i.val]'(by rw [size1961]; exact i.isLt)

theorem fields1961 (i : Fin 32) :
    (entry1961 i).IA = shift ∧ (entry1961 i).ID = S (225 + i.val + 1) ∧
      (entry1961 i).IC = S 194 ∧ (entry1961 i).Inext = T 193 (225 + i.val + 1) ∧
      (entry1961 i).Icur = T 193 (225 + i.val) ∧
      (entry1961 i).output = T 194 (225 + i.val) ∧
      (entry1961 i).charge = charge 193 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1961 (i : Fin 32) :
    forwardStepOK (-768) (charge 193 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 194) (T 193 (225 + i.val + 1))
      (T 193 (225 + i.val)) (T 194 (225 + i.val))
      (OriginalRow227Roots.root_pos 194 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 193 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1961.entries OriginalRow227TriangleForward1961.checked
    ⟨i.val, by rw [size1961]; exact i.isLt⟩
  change (entry1961 i).check = true at h
  rcases fields1961 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1962 : OriginalRow227TriangleForward1962.entries.size = 32 := rfl

def entry1962 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1962.entries[i.val]'(by rw [size1962]; exact i.isLt)

theorem fields1962 (i : Fin 32) :
    (entry1962 i).IA = shift ∧ (entry1962 i).ID = S (257 + i.val + 1) ∧
      (entry1962 i).IC = S 194 ∧ (entry1962 i).Inext = T 193 (257 + i.val + 1) ∧
      (entry1962 i).Icur = T 193 (257 + i.val) ∧
      (entry1962 i).output = T 194 (257 + i.val) ∧
      (entry1962 i).charge = charge 193 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1962 (i : Fin 32) :
    forwardStepOK (-768) (charge 193 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 194) (T 193 (257 + i.val + 1))
      (T 193 (257 + i.val)) (T 194 (257 + i.val))
      (OriginalRow227Roots.root_pos 194 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 193 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1962.entries OriginalRow227TriangleForward1962.checked
    ⟨i.val, by rw [size1962]; exact i.isLt⟩
  change (entry1962 i).check = true at h
  rcases fields1962 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1963 : OriginalRow227TriangleForward1963.entries.size = 19 := rfl

def entry1963 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1963.entries[i.val]'(by rw [size1963]; exact i.isLt)

theorem fields1963 (i : Fin 19) :
    (entry1963 i).IA = shift ∧ (entry1963 i).ID = S (289 + i.val + 1) ∧
      (entry1963 i).IC = S 194 ∧ (entry1963 i).Inext = T 193 (289 + i.val + 1) ∧
      (entry1963 i).Icur = T 193 (289 + i.val) ∧
      (entry1963 i).output = T 194 (289 + i.val) ∧
      (entry1963 i).charge = charge 193 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1963 (i : Fin 19) :
    forwardStepOK (-768) (charge 193 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 194) (T 193 (289 + i.val + 1))
      (T 193 (289 + i.val)) (T 194 (289 + i.val))
      (OriginalRow227Roots.root_pos 194 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 193 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1963.entries OriginalRow227TriangleForward1963.checked
    ⟨i.val, by rw [size1963]; exact i.isLt⟩
  change (entry1963 i).check = true at h
  rcases fields1963 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 193 ≤ d) (hhi : d < 308) :
    forwardStepOK (-768) (charge 193 d) shift (S (d + 1)) (S 194)
      (T 193 (d + 1)) (T 193 d) (T 194 d)
      (OriginalRow227Roots.root_pos 194 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 193 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h225 : d < 225
    ·
      have hi : d - 193 < 32 := by omega
      have heq : 193 + (d - 193) = d := by omega
      simpa only [heq] using step1960 ⟨d - 193, hi⟩
    ·
      have hi : d - 225 < 32 := by omega
      have heq : 225 + (d - 225) = d := by omega
      simpa only [heq] using step1961 ⟨d - 225, hi⟩
  ·
    by_cases h289 : d < 289
    ·
      have hi : d - 257 < 32 := by omega
      have heq : 257 + (d - 257) = d := by omega
      simpa only [heq] using step1962 ⟨d - 257, hi⟩
    ·
      have hi : d - 289 < 19 := by omega
      have heq : 289 + (d - 289) = d := by omega
      simpa only [heq] using step1963 ⟨d - 289, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.fields1960,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.step1960,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.fields1961,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.step1961,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.fields1962,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.step1962,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.fields1963,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.step1963,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow194
