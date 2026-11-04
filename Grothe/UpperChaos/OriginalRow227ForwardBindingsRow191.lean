import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191
import Grothe.UpperChaos.OriginalRow227TriangleForward1948
import Grothe.UpperChaos.OriginalRow227TriangleForward1949
import Grothe.UpperChaos.OriginalRow227TriangleForward1950
import Grothe.UpperChaos.OriginalRow227TriangleForward1951

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1948 : OriginalRow227TriangleForward1948.entries.size = 32 := rfl

def entry1948 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1948.entries[i.val]'(by rw [size1948]; exact i.isLt)

theorem fields1948 (i : Fin 32) :
    (entry1948 i).IA = shift ∧ (entry1948 i).ID = S (190 + i.val + 1) ∧
      (entry1948 i).IC = S 191 ∧ (entry1948 i).Inext = T 190 (190 + i.val + 1) ∧
      (entry1948 i).Icur = T 190 (190 + i.val) ∧
      (entry1948 i).output = T 191 (190 + i.val) ∧
      (entry1948 i).charge = charge 190 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1948 (i : Fin 32) :
    forwardStepOK (-768) (charge 190 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 191) (T 190 (190 + i.val + 1))
      (T 190 (190 + i.val)) (T 191 (190 + i.val))
      (OriginalRow227Roots.root_pos 191 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 190 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1948.entries OriginalRow227TriangleForward1948.checked
    ⟨i.val, by rw [size1948]; exact i.isLt⟩
  change (entry1948 i).check = true at h
  rcases fields1948 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1949 : OriginalRow227TriangleForward1949.entries.size = 32 := rfl

def entry1949 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1949.entries[i.val]'(by rw [size1949]; exact i.isLt)

theorem fields1949 (i : Fin 32) :
    (entry1949 i).IA = shift ∧ (entry1949 i).ID = S (222 + i.val + 1) ∧
      (entry1949 i).IC = S 191 ∧ (entry1949 i).Inext = T 190 (222 + i.val + 1) ∧
      (entry1949 i).Icur = T 190 (222 + i.val) ∧
      (entry1949 i).output = T 191 (222 + i.val) ∧
      (entry1949 i).charge = charge 190 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1949 (i : Fin 32) :
    forwardStepOK (-768) (charge 190 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 191) (T 190 (222 + i.val + 1))
      (T 190 (222 + i.val)) (T 191 (222 + i.val))
      (OriginalRow227Roots.root_pos 191 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 190 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1949.entries OriginalRow227TriangleForward1949.checked
    ⟨i.val, by rw [size1949]; exact i.isLt⟩
  change (entry1949 i).check = true at h
  rcases fields1949 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1950 : OriginalRow227TriangleForward1950.entries.size = 32 := rfl

def entry1950 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1950.entries[i.val]'(by rw [size1950]; exact i.isLt)

theorem fields1950 (i : Fin 32) :
    (entry1950 i).IA = shift ∧ (entry1950 i).ID = S (254 + i.val + 1) ∧
      (entry1950 i).IC = S 191 ∧ (entry1950 i).Inext = T 190 (254 + i.val + 1) ∧
      (entry1950 i).Icur = T 190 (254 + i.val) ∧
      (entry1950 i).output = T 191 (254 + i.val) ∧
      (entry1950 i).charge = charge 190 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1950 (i : Fin 32) :
    forwardStepOK (-768) (charge 190 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 191) (T 190 (254 + i.val + 1))
      (T 190 (254 + i.val)) (T 191 (254 + i.val))
      (OriginalRow227Roots.root_pos 191 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 190 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1950.entries OriginalRow227TriangleForward1950.checked
    ⟨i.val, by rw [size1950]; exact i.isLt⟩
  change (entry1950 i).check = true at h
  rcases fields1950 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1951 : OriginalRow227TriangleForward1951.entries.size = 25 := rfl

def entry1951 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1951.entries[i.val]'(by rw [size1951]; exact i.isLt)

theorem fields1951 (i : Fin 25) :
    (entry1951 i).IA = shift ∧ (entry1951 i).ID = S (286 + i.val + 1) ∧
      (entry1951 i).IC = S 191 ∧ (entry1951 i).Inext = T 190 (286 + i.val + 1) ∧
      (entry1951 i).Icur = T 190 (286 + i.val) ∧
      (entry1951 i).output = T 191 (286 + i.val) ∧
      (entry1951 i).charge = charge 190 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1951 (i : Fin 25) :
    forwardStepOK (-768) (charge 190 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 191) (T 190 (286 + i.val + 1))
      (T 190 (286 + i.val)) (T 191 (286 + i.val))
      (OriginalRow227Roots.root_pos 191 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 190 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1951.entries OriginalRow227TriangleForward1951.checked
    ⟨i.val, by rw [size1951]; exact i.isLt⟩
  change (entry1951 i).check = true at h
  rcases fields1951 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 190 ≤ d) (hhi : d < 311) :
    forwardStepOK (-768) (charge 190 d) shift (S (d + 1)) (S 191)
      (T 190 (d + 1)) (T 190 d) (T 191 d)
      (OriginalRow227Roots.root_pos 191 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 190 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h222 : d < 222
    ·
      have hi : d - 190 < 32 := by omega
      have heq : 190 + (d - 190) = d := by omega
      simpa only [heq] using step1948 ⟨d - 190, hi⟩
    ·
      have hi : d - 222 < 32 := by omega
      have heq : 222 + (d - 222) = d := by omega
      simpa only [heq] using step1949 ⟨d - 222, hi⟩
  ·
    by_cases h286 : d < 286
    ·
      have hi : d - 254 < 32 := by omega
      have heq : 254 + (d - 254) = d := by omega
      simpa only [heq] using step1950 ⟨d - 254, hi⟩
    ·
      have hi : d - 286 < 25 := by omega
      have heq : 286 + (d - 286) = d := by omega
      simpa only [heq] using step1951 ⟨d - 286, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.fields1948,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.step1948,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.fields1949,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.step1949,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.fields1950,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.step1950,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.fields1951,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.step1951,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow191
