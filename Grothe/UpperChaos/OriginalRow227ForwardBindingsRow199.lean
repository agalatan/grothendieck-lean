import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199
import Grothe.UpperChaos.OriginalRow227TriangleForward1980
import Grothe.UpperChaos.OriginalRow227TriangleForward1981
import Grothe.UpperChaos.OriginalRow227TriangleForward1982
import Grothe.UpperChaos.OriginalRow227TriangleForward1983

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1980 : OriginalRow227TriangleForward1980.entries.size = 32 := rfl

def entry1980 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1980.entries[i.val]'(by rw [size1980]; exact i.isLt)

theorem fields1980 (i : Fin 32) :
    (entry1980 i).IA = shift ∧ (entry1980 i).ID = S (198 + i.val + 1) ∧
      (entry1980 i).IC = S 199 ∧ (entry1980 i).Inext = T 198 (198 + i.val + 1) ∧
      (entry1980 i).Icur = T 198 (198 + i.val) ∧
      (entry1980 i).output = T 199 (198 + i.val) ∧
      (entry1980 i).charge = charge 198 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1992_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1980 (i : Fin 32) :
    forwardStepOK (-768) (charge 198 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 199) (T 198 (198 + i.val + 1))
      (T 198 (198 + i.val)) (T 199 (198 + i.val))
      (OriginalRow227Roots.root_pos 199 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 198 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1980.entries OriginalRow227TriangleForward1980.checked
    ⟨i.val, by rw [size1980]; exact i.isLt⟩
  change (entry1980 i).check = true at h
  rcases fields1980 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1981 : OriginalRow227TriangleForward1981.entries.size = 32 := rfl

def entry1981 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1981.entries[i.val]'(by rw [size1981]; exact i.isLt)

theorem fields1981 (i : Fin 32) :
    (entry1981 i).IA = shift ∧ (entry1981 i).ID = S (230 + i.val + 1) ∧
      (entry1981 i).IC = S 199 ∧ (entry1981 i).Inext = T 198 (230 + i.val + 1) ∧
      (entry1981 i).Icur = T 198 (230 + i.val) ∧
      (entry1981 i).output = T 199 (230 + i.val) ∧
      (entry1981 i).charge = charge 198 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1993_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1981 (i : Fin 32) :
    forwardStepOK (-768) (charge 198 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 199) (T 198 (230 + i.val + 1))
      (T 198 (230 + i.val)) (T 199 (230 + i.val))
      (OriginalRow227Roots.root_pos 199 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 198 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1981.entries OriginalRow227TriangleForward1981.checked
    ⟨i.val, by rw [size1981]; exact i.isLt⟩
  change (entry1981 i).check = true at h
  rcases fields1981 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1982 : OriginalRow227TriangleForward1982.entries.size = 32 := rfl

def entry1982 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1982.entries[i.val]'(by rw [size1982]; exact i.isLt)

theorem fields1982 (i : Fin 32) :
    (entry1982 i).IA = shift ∧ (entry1982 i).ID = S (262 + i.val + 1) ∧
      (entry1982 i).IC = S 199 ∧ (entry1982 i).Inext = T 198 (262 + i.val + 1) ∧
      (entry1982 i).Icur = T 198 (262 + i.val) ∧
      (entry1982 i).output = T 199 (262 + i.val) ∧
      (entry1982 i).charge = charge 198 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1994_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1982 (i : Fin 32) :
    forwardStepOK (-768) (charge 198 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 199) (T 198 (262 + i.val + 1))
      (T 198 (262 + i.val)) (T 199 (262 + i.val))
      (OriginalRow227Roots.root_pos 199 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 198 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1982.entries OriginalRow227TriangleForward1982.checked
    ⟨i.val, by rw [size1982]; exact i.isLt⟩
  change (entry1982 i).check = true at h
  rcases fields1982 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1983 : OriginalRow227TriangleForward1983.entries.size = 9 := rfl

def entry1983 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1983.entries[i.val]'(by rw [size1983]; exact i.isLt)

theorem fields1983 (i : Fin 9) :
    (entry1983 i).IA = shift ∧ (entry1983 i).ID = S (294 + i.val + 1) ∧
      (entry1983 i).IC = S 199 ∧ (entry1983 i).Inext = T 198 (294 + i.val + 1) ∧
      (entry1983 i).Icur = T 198 (294 + i.val) ∧
      (entry1983 i).output = T 199 (294 + i.val) ∧
      (entry1983 i).charge = charge 198 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow198.block1995_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1983 (i : Fin 9) :
    forwardStepOK (-768) (charge 198 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 199) (T 198 (294 + i.val + 1))
      (T 198 (294 + i.val)) (T 199 (294 + i.val))
      (OriginalRow227Roots.root_pos 199 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 198 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1983.entries OriginalRow227TriangleForward1983.checked
    ⟨i.val, by rw [size1983]; exact i.isLt⟩
  change (entry1983 i).check = true at h
  rcases fields1983 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 198 ≤ d) (hhi : d < 303) :
    forwardStepOK (-768) (charge 198 d) shift (S (d + 1)) (S 199)
      (T 198 (d + 1)) (T 198 d) (T 199 d)
      (OriginalRow227Roots.root_pos 199 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 198 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h230 : d < 230
    ·
      have hi : d - 198 < 32 := by omega
      have heq : 198 + (d - 198) = d := by omega
      simpa only [heq] using step1980 ⟨d - 198, hi⟩
    ·
      have hi : d - 230 < 32 := by omega
      have heq : 230 + (d - 230) = d := by omega
      simpa only [heq] using step1981 ⟨d - 230, hi⟩
  ·
    by_cases h294 : d < 294
    ·
      have hi : d - 262 < 32 := by omega
      have heq : 262 + (d - 262) = d := by omega
      simpa only [heq] using step1982 ⟨d - 262, hi⟩
    ·
      have hi : d - 294 < 9 := by omega
      have heq : 294 + (d - 294) = d := by omega
      simpa only [heq] using step1983 ⟨d - 294, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.fields1980,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.step1980,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.fields1981,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.step1981,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.fields1982,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.step1982,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.fields1983,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.step1983,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow199
