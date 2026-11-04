import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow194
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195
import Grothe.UpperChaos.OriginalRow227TriangleForward1964
import Grothe.UpperChaos.OriginalRow227TriangleForward1965
import Grothe.UpperChaos.OriginalRow227TriangleForward1966
import Grothe.UpperChaos.OriginalRow227TriangleForward1967

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1964 : OriginalRow227TriangleForward1964.entries.size = 32 := rfl

def entry1964 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1964.entries[i.val]'(by rw [size1964]; exact i.isLt)

theorem fields1964 (i : Fin 32) :
    (entry1964 i).IA = shift ∧ (entry1964 i).ID = S (194 + i.val + 1) ∧
      (entry1964 i).IC = S 195 ∧ (entry1964 i).Inext = T 194 (194 + i.val + 1) ∧
      (entry1964 i).Icur = T 194 (194 + i.val) ∧
      (entry1964 i).output = T 195 (194 + i.val) ∧
      (entry1964 i).charge = charge 194 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1976_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1964 (i : Fin 32) :
    forwardStepOK (-768) (charge 194 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 195) (T 194 (194 + i.val + 1))
      (T 194 (194 + i.val)) (T 195 (194 + i.val))
      (OriginalRow227Roots.root_pos 195 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 194 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1964.entries OriginalRow227TriangleForward1964.checked
    ⟨i.val, by rw [size1964]; exact i.isLt⟩
  change (entry1964 i).check = true at h
  rcases fields1964 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1965 : OriginalRow227TriangleForward1965.entries.size = 32 := rfl

def entry1965 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1965.entries[i.val]'(by rw [size1965]; exact i.isLt)

theorem fields1965 (i : Fin 32) :
    (entry1965 i).IA = shift ∧ (entry1965 i).ID = S (226 + i.val + 1) ∧
      (entry1965 i).IC = S 195 ∧ (entry1965 i).Inext = T 194 (226 + i.val + 1) ∧
      (entry1965 i).Icur = T 194 (226 + i.val) ∧
      (entry1965 i).output = T 195 (226 + i.val) ∧
      (entry1965 i).charge = charge 194 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1977_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1965 (i : Fin 32) :
    forwardStepOK (-768) (charge 194 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 195) (T 194 (226 + i.val + 1))
      (T 194 (226 + i.val)) (T 195 (226 + i.val))
      (OriginalRow227Roots.root_pos 195 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 194 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1965.entries OriginalRow227TriangleForward1965.checked
    ⟨i.val, by rw [size1965]; exact i.isLt⟩
  change (entry1965 i).check = true at h
  rcases fields1965 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1966 : OriginalRow227TriangleForward1966.entries.size = 32 := rfl

def entry1966 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1966.entries[i.val]'(by rw [size1966]; exact i.isLt)

theorem fields1966 (i : Fin 32) :
    (entry1966 i).IA = shift ∧ (entry1966 i).ID = S (258 + i.val + 1) ∧
      (entry1966 i).IC = S 195 ∧ (entry1966 i).Inext = T 194 (258 + i.val + 1) ∧
      (entry1966 i).Icur = T 194 (258 + i.val) ∧
      (entry1966 i).output = T 195 (258 + i.val) ∧
      (entry1966 i).charge = charge 194 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1978_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1966 (i : Fin 32) :
    forwardStepOK (-768) (charge 194 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 195) (T 194 (258 + i.val + 1))
      (T 194 (258 + i.val)) (T 195 (258 + i.val))
      (OriginalRow227Roots.root_pos 195 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 194 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1966.entries OriginalRow227TriangleForward1966.checked
    ⟨i.val, by rw [size1966]; exact i.isLt⟩
  change (entry1966 i).check = true at h
  rcases fields1966 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1967 : OriginalRow227TriangleForward1967.entries.size = 17 := rfl

def entry1967 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1967.entries[i.val]'(by rw [size1967]; exact i.isLt)

theorem fields1967 (i : Fin 17) :
    (entry1967 i).IA = shift ∧ (entry1967 i).ID = S (290 + i.val + 1) ∧
      (entry1967 i).IC = S 195 ∧ (entry1967 i).Inext = T 194 (290 + i.val + 1) ∧
      (entry1967 i).Icur = T 194 (290 + i.val) ∧
      (entry1967 i).output = T 195 (290 + i.val) ∧
      (entry1967 i).charge = charge 194 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow194.block1979_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1967 (i : Fin 17) :
    forwardStepOK (-768) (charge 194 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 195) (T 194 (290 + i.val + 1))
      (T 194 (290 + i.val)) (T 195 (290 + i.val))
      (OriginalRow227Roots.root_pos 195 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 194 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1967.entries OriginalRow227TriangleForward1967.checked
    ⟨i.val, by rw [size1967]; exact i.isLt⟩
  change (entry1967 i).check = true at h
  rcases fields1967 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 194 ≤ d) (hhi : d < 307) :
    forwardStepOK (-768) (charge 194 d) shift (S (d + 1)) (S 195)
      (T 194 (d + 1)) (T 194 d) (T 195 d)
      (OriginalRow227Roots.root_pos 195 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 194 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h226 : d < 226
    ·
      have hi : d - 194 < 32 := by omega
      have heq : 194 + (d - 194) = d := by omega
      simpa only [heq] using step1964 ⟨d - 194, hi⟩
    ·
      have hi : d - 226 < 32 := by omega
      have heq : 226 + (d - 226) = d := by omega
      simpa only [heq] using step1965 ⟨d - 226, hi⟩
  ·
    by_cases h290 : d < 290
    ·
      have hi : d - 258 < 32 := by omega
      have heq : 258 + (d - 258) = d := by omega
      simpa only [heq] using step1966 ⟨d - 258, hi⟩
    ·
      have hi : d - 290 < 17 := by omega
      have heq : 290 + (d - 290) = d := by omega
      simpa only [heq] using step1967 ⟨d - 290, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.fields1964,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.step1964,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.fields1965,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.step1965,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.fields1966,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.step1966,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.fields1967,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.step1967,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow195
