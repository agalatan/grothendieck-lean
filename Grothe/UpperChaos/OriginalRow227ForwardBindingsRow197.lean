import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197
import Grothe.UpperChaos.OriginalRow227TriangleForward1972
import Grothe.UpperChaos.OriginalRow227TriangleForward1973
import Grothe.UpperChaos.OriginalRow227TriangleForward1974
import Grothe.UpperChaos.OriginalRow227TriangleForward1975

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1972 : OriginalRow227TriangleForward1972.entries.size = 32 := rfl

def entry1972 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1972.entries[i.val]'(by rw [size1972]; exact i.isLt)

theorem fields1972 (i : Fin 32) :
    (entry1972 i).IA = shift ∧ (entry1972 i).ID = S (196 + i.val + 1) ∧
      (entry1972 i).IC = S 197 ∧ (entry1972 i).Inext = T 196 (196 + i.val + 1) ∧
      (entry1972 i).Icur = T 196 (196 + i.val) ∧
      (entry1972 i).output = T 197 (196 + i.val) ∧
      (entry1972 i).charge = charge 196 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1984_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1972 (i : Fin 32) :
    forwardStepOK (-768) (charge 196 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 197) (T 196 (196 + i.val + 1))
      (T 196 (196 + i.val)) (T 197 (196 + i.val))
      (OriginalRow227Roots.root_pos 197 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 196 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1972.entries OriginalRow227TriangleForward1972.checked
    ⟨i.val, by rw [size1972]; exact i.isLt⟩
  change (entry1972 i).check = true at h
  rcases fields1972 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1973 : OriginalRow227TriangleForward1973.entries.size = 32 := rfl

def entry1973 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1973.entries[i.val]'(by rw [size1973]; exact i.isLt)

theorem fields1973 (i : Fin 32) :
    (entry1973 i).IA = shift ∧ (entry1973 i).ID = S (228 + i.val + 1) ∧
      (entry1973 i).IC = S 197 ∧ (entry1973 i).Inext = T 196 (228 + i.val + 1) ∧
      (entry1973 i).Icur = T 196 (228 + i.val) ∧
      (entry1973 i).output = T 197 (228 + i.val) ∧
      (entry1973 i).charge = charge 196 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1985_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1973 (i : Fin 32) :
    forwardStepOK (-768) (charge 196 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 197) (T 196 (228 + i.val + 1))
      (T 196 (228 + i.val)) (T 197 (228 + i.val))
      (OriginalRow227Roots.root_pos 197 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 196 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1973.entries OriginalRow227TriangleForward1973.checked
    ⟨i.val, by rw [size1973]; exact i.isLt⟩
  change (entry1973 i).check = true at h
  rcases fields1973 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1974 : OriginalRow227TriangleForward1974.entries.size = 32 := rfl

def entry1974 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1974.entries[i.val]'(by rw [size1974]; exact i.isLt)

theorem fields1974 (i : Fin 32) :
    (entry1974 i).IA = shift ∧ (entry1974 i).ID = S (260 + i.val + 1) ∧
      (entry1974 i).IC = S 197 ∧ (entry1974 i).Inext = T 196 (260 + i.val + 1) ∧
      (entry1974 i).Icur = T 196 (260 + i.val) ∧
      (entry1974 i).output = T 197 (260 + i.val) ∧
      (entry1974 i).charge = charge 196 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1986_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1974 (i : Fin 32) :
    forwardStepOK (-768) (charge 196 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 197) (T 196 (260 + i.val + 1))
      (T 196 (260 + i.val)) (T 197 (260 + i.val))
      (OriginalRow227Roots.root_pos 197 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 196 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1974.entries OriginalRow227TriangleForward1974.checked
    ⟨i.val, by rw [size1974]; exact i.isLt⟩
  change (entry1974 i).check = true at h
  rcases fields1974 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1975 : OriginalRow227TriangleForward1975.entries.size = 13 := rfl

def entry1975 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1975.entries[i.val]'(by rw [size1975]; exact i.isLt)

theorem fields1975 (i : Fin 13) :
    (entry1975 i).IA = shift ∧ (entry1975 i).ID = S (292 + i.val + 1) ∧
      (entry1975 i).IC = S 197 ∧ (entry1975 i).Inext = T 196 (292 + i.val + 1) ∧
      (entry1975 i).Icur = T 196 (292 + i.val) ∧
      (entry1975 i).output = T 197 (292 + i.val) ∧
      (entry1975 i).charge = charge 196 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow196.block1987_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1975 (i : Fin 13) :
    forwardStepOK (-768) (charge 196 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 197) (T 196 (292 + i.val + 1))
      (T 196 (292 + i.val)) (T 197 (292 + i.val))
      (OriginalRow227Roots.root_pos 197 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 196 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1975.entries OriginalRow227TriangleForward1975.checked
    ⟨i.val, by rw [size1975]; exact i.isLt⟩
  change (entry1975 i).check = true at h
  rcases fields1975 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 196 ≤ d) (hhi : d < 305) :
    forwardStepOK (-768) (charge 196 d) shift (S (d + 1)) (S 197)
      (T 196 (d + 1)) (T 196 d) (T 197 d)
      (OriginalRow227Roots.root_pos 197 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 196 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h228 : d < 228
    ·
      have hi : d - 196 < 32 := by omega
      have heq : 196 + (d - 196) = d := by omega
      simpa only [heq] using step1972 ⟨d - 196, hi⟩
    ·
      have hi : d - 228 < 32 := by omega
      have heq : 228 + (d - 228) = d := by omega
      simpa only [heq] using step1973 ⟨d - 228, hi⟩
  ·
    by_cases h292 : d < 292
    ·
      have hi : d - 260 < 32 := by omega
      have heq : 260 + (d - 260) = d := by omega
      simpa only [heq] using step1974 ⟨d - 260, hi⟩
    ·
      have hi : d - 292 < 13 := by omega
      have heq : 292 + (d - 292) = d := by omega
      simpa only [heq] using step1975 ⟨d - 292, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.fields1972,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.step1972,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.fields1973,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.step1973,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.fields1974,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.step1974,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.fields1975,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.step1975,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow197
