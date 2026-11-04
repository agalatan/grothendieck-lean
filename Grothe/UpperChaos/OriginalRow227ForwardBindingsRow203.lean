import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203
import Grothe.UpperChaos.OriginalRow227TriangleForward1996
import Grothe.UpperChaos.OriginalRow227TriangleForward1997
import Grothe.UpperChaos.OriginalRow227TriangleForward1998
import Grothe.UpperChaos.OriginalRow227TriangleForward1999

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1996 : OriginalRow227TriangleForward1996.entries.size = 32 := rfl

def entry1996 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1996.entries[i.val]'(by rw [size1996]; exact i.isLt)

theorem fields1996 (i : Fin 32) :
    (entry1996 i).IA = shift ∧ (entry1996 i).ID = S (202 + i.val + 1) ∧
      (entry1996 i).IC = S 203 ∧ (entry1996 i).Inext = T 202 (202 + i.val + 1) ∧
      (entry1996 i).Icur = T 202 (202 + i.val) ∧
      (entry1996 i).output = T 203 (202 + i.val) ∧
      (entry1996 i).charge = charge 202 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1996 (i : Fin 32) :
    forwardStepOK (-768) (charge 202 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 203) (T 202 (202 + i.val + 1))
      (T 202 (202 + i.val)) (T 203 (202 + i.val))
      (OriginalRow227Roots.root_pos 203 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 202 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1996.entries OriginalRow227TriangleForward1996.checked
    ⟨i.val, by rw [size1996]; exact i.isLt⟩
  change (entry1996 i).check = true at h
  rcases fields1996 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1997 : OriginalRow227TriangleForward1997.entries.size = 32 := rfl

def entry1997 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1997.entries[i.val]'(by rw [size1997]; exact i.isLt)

theorem fields1997 (i : Fin 32) :
    (entry1997 i).IA = shift ∧ (entry1997 i).ID = S (234 + i.val + 1) ∧
      (entry1997 i).IC = S 203 ∧ (entry1997 i).Inext = T 202 (234 + i.val + 1) ∧
      (entry1997 i).Icur = T 202 (234 + i.val) ∧
      (entry1997 i).output = T 203 (234 + i.val) ∧
      (entry1997 i).charge = charge 202 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1997 (i : Fin 32) :
    forwardStepOK (-768) (charge 202 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 203) (T 202 (234 + i.val + 1))
      (T 202 (234 + i.val)) (T 203 (234 + i.val))
      (OriginalRow227Roots.root_pos 203 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 202 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1997.entries OriginalRow227TriangleForward1997.checked
    ⟨i.val, by rw [size1997]; exact i.isLt⟩
  change (entry1997 i).check = true at h
  rcases fields1997 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1998 : OriginalRow227TriangleForward1998.entries.size = 32 := rfl

def entry1998 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1998.entries[i.val]'(by rw [size1998]; exact i.isLt)

theorem fields1998 (i : Fin 32) :
    (entry1998 i).IA = shift ∧ (entry1998 i).ID = S (266 + i.val + 1) ∧
      (entry1998 i).IC = S 203 ∧ (entry1998 i).Inext = T 202 (266 + i.val + 1) ∧
      (entry1998 i).Icur = T 202 (266 + i.val) ∧
      (entry1998 i).output = T 203 (266 + i.val) ∧
      (entry1998 i).charge = charge 202 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1998 (i : Fin 32) :
    forwardStepOK (-768) (charge 202 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 203) (T 202 (266 + i.val + 1))
      (T 202 (266 + i.val)) (T 203 (266 + i.val))
      (OriginalRow227Roots.root_pos 203 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 202 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1998.entries OriginalRow227TriangleForward1998.checked
    ⟨i.val, by rw [size1998]; exact i.isLt⟩
  change (entry1998 i).check = true at h
  rcases fields1998 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1999 : OriginalRow227TriangleForward1999.entries.size = 1 := rfl

def entry1999 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1999.entries[i.val]'(by rw [size1999]; exact i.isLt)

theorem fields1999 (i : Fin 1) :
    (entry1999 i).IA = shift ∧ (entry1999 i).ID = S (298 + i.val + 1) ∧
      (entry1999 i).IC = S 203 ∧ (entry1999 i).Inext = T 202 (298 + i.val + 1) ∧
      (entry1999 i).Icur = T 202 (298 + i.val) ∧
      (entry1999 i).output = T 203 (298 + i.val) ∧
      (entry1999 i).charge = charge 202 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2015_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1999 (i : Fin 1) :
    forwardStepOK (-768) (charge 202 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 203) (T 202 (298 + i.val + 1))
      (T 202 (298 + i.val)) (T 203 (298 + i.val))
      (OriginalRow227Roots.root_pos 203 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 202 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1999.entries OriginalRow227TriangleForward1999.checked
    ⟨i.val, by rw [size1999]; exact i.isLt⟩
  change (entry1999 i).check = true at h
  rcases fields1999 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 202 ≤ d) (hhi : d < 299) :
    forwardStepOK (-768) (charge 202 d) shift (S (d + 1)) (S 203)
      (T 202 (d + 1)) (T 202 d) (T 203 d)
      (OriginalRow227Roots.root_pos 203 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 202 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h234 : d < 234
    ·
      have hi : d - 202 < 32 := by omega
      have heq : 202 + (d - 202) = d := by omega
      simpa only [heq] using step1996 ⟨d - 202, hi⟩
    ·
      have hi : d - 234 < 32 := by omega
      have heq : 234 + (d - 234) = d := by omega
      simpa only [heq] using step1997 ⟨d - 234, hi⟩
  ·
    by_cases h298 : d < 298
    ·
      have hi : d - 266 < 32 := by omega
      have heq : 266 + (d - 266) = d := by omega
      simpa only [heq] using step1998 ⟨d - 266, hi⟩
    ·
      have hi : d - 298 < 1 := by omega
      have heq : 298 + (d - 298) = d := by omega
      simpa only [heq] using step1999 ⟨d - 298, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.fields1996,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.step1996,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.fields1997,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.step1997,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.fields1998,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.step1998,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.fields1999,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.step1999,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow203
