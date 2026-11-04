import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow197
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198
import Grothe.UpperChaos.OriginalRow227TriangleForward1976
import Grothe.UpperChaos.OriginalRow227TriangleForward1977
import Grothe.UpperChaos.OriginalRow227TriangleForward1978
import Grothe.UpperChaos.OriginalRow227TriangleForward1979

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1976 : OriginalRow227TriangleForward1976.entries.size = 32 := rfl

def entry1976 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1976.entries[i.val]'(by rw [size1976]; exact i.isLt)

theorem fields1976 (i : Fin 32) :
    (entry1976 i).IA = shift ∧ (entry1976 i).ID = S (197 + i.val + 1) ∧
      (entry1976 i).IC = S 198 ∧ (entry1976 i).Inext = T 197 (197 + i.val + 1) ∧
      (entry1976 i).Icur = T 197 (197 + i.val) ∧
      (entry1976 i).output = T 198 (197 + i.val) ∧
      (entry1976 i).charge = charge 197 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1988_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1976 (i : Fin 32) :
    forwardStepOK (-768) (charge 197 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 198) (T 197 (197 + i.val + 1))
      (T 197 (197 + i.val)) (T 198 (197 + i.val))
      (OriginalRow227Roots.root_pos 198 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 197 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1976.entries OriginalRow227TriangleForward1976.checked
    ⟨i.val, by rw [size1976]; exact i.isLt⟩
  change (entry1976 i).check = true at h
  rcases fields1976 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1977 : OriginalRow227TriangleForward1977.entries.size = 32 := rfl

def entry1977 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1977.entries[i.val]'(by rw [size1977]; exact i.isLt)

theorem fields1977 (i : Fin 32) :
    (entry1977 i).IA = shift ∧ (entry1977 i).ID = S (229 + i.val + 1) ∧
      (entry1977 i).IC = S 198 ∧ (entry1977 i).Inext = T 197 (229 + i.val + 1) ∧
      (entry1977 i).Icur = T 197 (229 + i.val) ∧
      (entry1977 i).output = T 198 (229 + i.val) ∧
      (entry1977 i).charge = charge 197 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1989_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1977 (i : Fin 32) :
    forwardStepOK (-768) (charge 197 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 198) (T 197 (229 + i.val + 1))
      (T 197 (229 + i.val)) (T 198 (229 + i.val))
      (OriginalRow227Roots.root_pos 198 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 197 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1977.entries OriginalRow227TriangleForward1977.checked
    ⟨i.val, by rw [size1977]; exact i.isLt⟩
  change (entry1977 i).check = true at h
  rcases fields1977 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1978 : OriginalRow227TriangleForward1978.entries.size = 32 := rfl

def entry1978 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1978.entries[i.val]'(by rw [size1978]; exact i.isLt)

theorem fields1978 (i : Fin 32) :
    (entry1978 i).IA = shift ∧ (entry1978 i).ID = S (261 + i.val + 1) ∧
      (entry1978 i).IC = S 198 ∧ (entry1978 i).Inext = T 197 (261 + i.val + 1) ∧
      (entry1978 i).Icur = T 197 (261 + i.val) ∧
      (entry1978 i).output = T 198 (261 + i.val) ∧
      (entry1978 i).charge = charge 197 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1990_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1978 (i : Fin 32) :
    forwardStepOK (-768) (charge 197 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 198) (T 197 (261 + i.val + 1))
      (T 197 (261 + i.val)) (T 198 (261 + i.val))
      (OriginalRow227Roots.root_pos 198 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 197 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1978.entries OriginalRow227TriangleForward1978.checked
    ⟨i.val, by rw [size1978]; exact i.isLt⟩
  change (entry1978 i).check = true at h
  rcases fields1978 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1979 : OriginalRow227TriangleForward1979.entries.size = 11 := rfl

def entry1979 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1979.entries[i.val]'(by rw [size1979]; exact i.isLt)

theorem fields1979 (i : Fin 11) :
    (entry1979 i).IA = shift ∧ (entry1979 i).ID = S (293 + i.val + 1) ∧
      (entry1979 i).IC = S 198 ∧ (entry1979 i).Inext = T 197 (293 + i.val + 1) ∧
      (entry1979 i).Icur = T 197 (293 + i.val) ∧
      (entry1979 i).output = T 198 (293 + i.val) ∧
      (entry1979 i).charge = charge 197 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow197.block1991_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1979 (i : Fin 11) :
    forwardStepOK (-768) (charge 197 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 198) (T 197 (293 + i.val + 1))
      (T 197 (293 + i.val)) (T 198 (293 + i.val))
      (OriginalRow227Roots.root_pos 198 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 197 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1979.entries OriginalRow227TriangleForward1979.checked
    ⟨i.val, by rw [size1979]; exact i.isLt⟩
  change (entry1979 i).check = true at h
  rcases fields1979 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 197 ≤ d) (hhi : d < 304) :
    forwardStepOK (-768) (charge 197 d) shift (S (d + 1)) (S 198)
      (T 197 (d + 1)) (T 197 d) (T 198 d)
      (OriginalRow227Roots.root_pos 198 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 197 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h229 : d < 229
    ·
      have hi : d - 197 < 32 := by omega
      have heq : 197 + (d - 197) = d := by omega
      simpa only [heq] using step1976 ⟨d - 197, hi⟩
    ·
      have hi : d - 229 < 32 := by omega
      have heq : 229 + (d - 229) = d := by omega
      simpa only [heq] using step1977 ⟨d - 229, hi⟩
  ·
    by_cases h293 : d < 293
    ·
      have hi : d - 261 < 32 := by omega
      have heq : 261 + (d - 261) = d := by omega
      simpa only [heq] using step1978 ⟨d - 261, hi⟩
    ·
      have hi : d - 293 < 11 := by omega
      have heq : 293 + (d - 293) = d := by omega
      simpa only [heq] using step1979 ⟨d - 293, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.fields1976,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.step1976,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.fields1977,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.step1977,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.fields1978,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.step1978,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.fields1979,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.step1979,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow198
