import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196
import Grothe.UpperChaos.OriginalRow227TriangleForward1968
import Grothe.UpperChaos.OriginalRow227TriangleForward1969
import Grothe.UpperChaos.OriginalRow227TriangleForward1970
import Grothe.UpperChaos.OriginalRow227TriangleForward1971

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1968 : OriginalRow227TriangleForward1968.entries.size = 32 := rfl

def entry1968 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1968.entries[i.val]'(by rw [size1968]; exact i.isLt)

theorem fields1968 (i : Fin 32) :
    (entry1968 i).IA = shift ∧ (entry1968 i).ID = S (195 + i.val + 1) ∧
      (entry1968 i).IC = S 196 ∧ (entry1968 i).Inext = T 195 (195 + i.val + 1) ∧
      (entry1968 i).Icur = T 195 (195 + i.val) ∧
      (entry1968 i).output = T 196 (195 + i.val) ∧
      (entry1968 i).charge = charge 195 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1980_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1968 (i : Fin 32) :
    forwardStepOK (-768) (charge 195 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 196) (T 195 (195 + i.val + 1))
      (T 195 (195 + i.val)) (T 196 (195 + i.val))
      (OriginalRow227Roots.root_pos 196 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 195 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1968.entries OriginalRow227TriangleForward1968.checked
    ⟨i.val, by rw [size1968]; exact i.isLt⟩
  change (entry1968 i).check = true at h
  rcases fields1968 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1969 : OriginalRow227TriangleForward1969.entries.size = 32 := rfl

def entry1969 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1969.entries[i.val]'(by rw [size1969]; exact i.isLt)

theorem fields1969 (i : Fin 32) :
    (entry1969 i).IA = shift ∧ (entry1969 i).ID = S (227 + i.val + 1) ∧
      (entry1969 i).IC = S 196 ∧ (entry1969 i).Inext = T 195 (227 + i.val + 1) ∧
      (entry1969 i).Icur = T 195 (227 + i.val) ∧
      (entry1969 i).output = T 196 (227 + i.val) ∧
      (entry1969 i).charge = charge 195 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1981_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1969 (i : Fin 32) :
    forwardStepOK (-768) (charge 195 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 196) (T 195 (227 + i.val + 1))
      (T 195 (227 + i.val)) (T 196 (227 + i.val))
      (OriginalRow227Roots.root_pos 196 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 195 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1969.entries OriginalRow227TriangleForward1969.checked
    ⟨i.val, by rw [size1969]; exact i.isLt⟩
  change (entry1969 i).check = true at h
  rcases fields1969 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1970 : OriginalRow227TriangleForward1970.entries.size = 32 := rfl

def entry1970 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1970.entries[i.val]'(by rw [size1970]; exact i.isLt)

theorem fields1970 (i : Fin 32) :
    (entry1970 i).IA = shift ∧ (entry1970 i).ID = S (259 + i.val + 1) ∧
      (entry1970 i).IC = S 196 ∧ (entry1970 i).Inext = T 195 (259 + i.val + 1) ∧
      (entry1970 i).Icur = T 195 (259 + i.val) ∧
      (entry1970 i).output = T 196 (259 + i.val) ∧
      (entry1970 i).charge = charge 195 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1982_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1970 (i : Fin 32) :
    forwardStepOK (-768) (charge 195 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 196) (T 195 (259 + i.val + 1))
      (T 195 (259 + i.val)) (T 196 (259 + i.val))
      (OriginalRow227Roots.root_pos 196 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 195 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1970.entries OriginalRow227TriangleForward1970.checked
    ⟨i.val, by rw [size1970]; exact i.isLt⟩
  change (entry1970 i).check = true at h
  rcases fields1970 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1971 : OriginalRow227TriangleForward1971.entries.size = 15 := rfl

def entry1971 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1971.entries[i.val]'(by rw [size1971]; exact i.isLt)

theorem fields1971 (i : Fin 15) :
    (entry1971 i).IA = shift ∧ (entry1971 i).ID = S (291 + i.val + 1) ∧
      (entry1971 i).IC = S 196 ∧ (entry1971 i).Inext = T 195 (291 + i.val + 1) ∧
      (entry1971 i).Icur = T 195 (291 + i.val) ∧
      (entry1971 i).output = T 196 (291 + i.val) ∧
      (entry1971 i).charge = charge 195 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow195.block1983_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1971 (i : Fin 15) :
    forwardStepOK (-768) (charge 195 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 196) (T 195 (291 + i.val + 1))
      (T 195 (291 + i.val)) (T 196 (291 + i.val))
      (OriginalRow227Roots.root_pos 196 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 195 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1971.entries OriginalRow227TriangleForward1971.checked
    ⟨i.val, by rw [size1971]; exact i.isLt⟩
  change (entry1971 i).check = true at h
  rcases fields1971 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 195 ≤ d) (hhi : d < 306) :
    forwardStepOK (-768) (charge 195 d) shift (S (d + 1)) (S 196)
      (T 195 (d + 1)) (T 195 d) (T 196 d)
      (OriginalRow227Roots.root_pos 196 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 195 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h227 : d < 227
    ·
      have hi : d - 195 < 32 := by omega
      have heq : 195 + (d - 195) = d := by omega
      simpa only [heq] using step1968 ⟨d - 195, hi⟩
    ·
      have hi : d - 227 < 32 := by omega
      have heq : 227 + (d - 227) = d := by omega
      simpa only [heq] using step1969 ⟨d - 227, hi⟩
  ·
    by_cases h291 : d < 291
    ·
      have hi : d - 259 < 32 := by omega
      have heq : 259 + (d - 259) = d := by omega
      simpa only [heq] using step1970 ⟨d - 259, hi⟩
    ·
      have hi : d - 291 < 15 := by omega
      have heq : 291 + (d - 291) = d := by omega
      simpa only [heq] using step1971 ⟨d - 291, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.fields1968,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.step1968,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.fields1969,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.step1969,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.fields1970,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.step1970,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.fields1971,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.step1971,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow196
