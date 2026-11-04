import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202
import Grothe.UpperChaos.OriginalRow227TriangleForward1992
import Grothe.UpperChaos.OriginalRow227TriangleForward1993
import Grothe.UpperChaos.OriginalRow227TriangleForward1994
import Grothe.UpperChaos.OriginalRow227TriangleForward1995

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1992 : OriginalRow227TriangleForward1992.entries.size = 32 := rfl

def entry1992 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1992.entries[i.val]'(by rw [size1992]; exact i.isLt)

theorem fields1992 (i : Fin 32) :
    (entry1992 i).IA = shift ∧ (entry1992 i).ID = S (201 + i.val + 1) ∧
      (entry1992 i).IC = S 202 ∧ (entry1992 i).Inext = T 201 (201 + i.val + 1) ∧
      (entry1992 i).Icur = T 201 (201 + i.val) ∧
      (entry1992 i).output = T 202 (201 + i.val) ∧
      (entry1992 i).charge = charge 201 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2008_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1992 (i : Fin 32) :
    forwardStepOK (-768) (charge 201 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 202) (T 201 (201 + i.val + 1))
      (T 201 (201 + i.val)) (T 202 (201 + i.val))
      (OriginalRow227Roots.root_pos 202 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 201 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1992.entries OriginalRow227TriangleForward1992.checked
    ⟨i.val, by rw [size1992]; exact i.isLt⟩
  change (entry1992 i).check = true at h
  rcases fields1992 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1993 : OriginalRow227TriangleForward1993.entries.size = 32 := rfl

def entry1993 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1993.entries[i.val]'(by rw [size1993]; exact i.isLt)

theorem fields1993 (i : Fin 32) :
    (entry1993 i).IA = shift ∧ (entry1993 i).ID = S (233 + i.val + 1) ∧
      (entry1993 i).IC = S 202 ∧ (entry1993 i).Inext = T 201 (233 + i.val + 1) ∧
      (entry1993 i).Icur = T 201 (233 + i.val) ∧
      (entry1993 i).output = T 202 (233 + i.val) ∧
      (entry1993 i).charge = charge 201 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2009_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1993 (i : Fin 32) :
    forwardStepOK (-768) (charge 201 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 202) (T 201 (233 + i.val + 1))
      (T 201 (233 + i.val)) (T 202 (233 + i.val))
      (OriginalRow227Roots.root_pos 202 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 201 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1993.entries OriginalRow227TriangleForward1993.checked
    ⟨i.val, by rw [size1993]; exact i.isLt⟩
  change (entry1993 i).check = true at h
  rcases fields1993 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1994 : OriginalRow227TriangleForward1994.entries.size = 32 := rfl

def entry1994 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1994.entries[i.val]'(by rw [size1994]; exact i.isLt)

theorem fields1994 (i : Fin 32) :
    (entry1994 i).IA = shift ∧ (entry1994 i).ID = S (265 + i.val + 1) ∧
      (entry1994 i).IC = S 202 ∧ (entry1994 i).Inext = T 201 (265 + i.val + 1) ∧
      (entry1994 i).Icur = T 201 (265 + i.val) ∧
      (entry1994 i).output = T 202 (265 + i.val) ∧
      (entry1994 i).charge = charge 201 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2010_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1994 (i : Fin 32) :
    forwardStepOK (-768) (charge 201 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 202) (T 201 (265 + i.val + 1))
      (T 201 (265 + i.val)) (T 202 (265 + i.val))
      (OriginalRow227Roots.root_pos 202 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 201 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1994.entries OriginalRow227TriangleForward1994.checked
    ⟨i.val, by rw [size1994]; exact i.isLt⟩
  change (entry1994 i).check = true at h
  rcases fields1994 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1995 : OriginalRow227TriangleForward1995.entries.size = 3 := rfl

def entry1995 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1995.entries[i.val]'(by rw [size1995]; exact i.isLt)

theorem fields1995 (i : Fin 3) :
    (entry1995 i).IA = shift ∧ (entry1995 i).ID = S (297 + i.val + 1) ∧
      (entry1995 i).IC = S 202 ∧ (entry1995 i).Inext = T 201 (297 + i.val + 1) ∧
      (entry1995 i).Icur = T 201 (297 + i.val) ∧
      (entry1995 i).output = T 202 (297 + i.val) ∧
      (entry1995 i).charge = charge 201 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow202.block2011_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1995 (i : Fin 3) :
    forwardStepOK (-768) (charge 201 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 202) (T 201 (297 + i.val + 1))
      (T 201 (297 + i.val)) (T 202 (297 + i.val))
      (OriginalRow227Roots.root_pos 202 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 201 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1995.entries OriginalRow227TriangleForward1995.checked
    ⟨i.val, by rw [size1995]; exact i.isLt⟩
  change (entry1995 i).check = true at h
  rcases fields1995 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 201 ≤ d) (hhi : d < 300) :
    forwardStepOK (-768) (charge 201 d) shift (S (d + 1)) (S 202)
      (T 201 (d + 1)) (T 201 d) (T 202 d)
      (OriginalRow227Roots.root_pos 202 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 201 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h233 : d < 233
    ·
      have hi : d - 201 < 32 := by omega
      have heq : 201 + (d - 201) = d := by omega
      simpa only [heq] using step1992 ⟨d - 201, hi⟩
    ·
      have hi : d - 233 < 32 := by omega
      have heq : 233 + (d - 233) = d := by omega
      simpa only [heq] using step1993 ⟨d - 233, hi⟩
  ·
    by_cases h297 : d < 297
    ·
      have hi : d - 265 < 32 := by omega
      have heq : 265 + (d - 265) = d := by omega
      simpa only [heq] using step1994 ⟨d - 265, hi⟩
    ·
      have hi : d - 297 < 3 := by omega
      have heq : 297 + (d - 297) = d := by omega
      simpa only [heq] using step1995 ⟨d - 297, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.fields1992,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.step1992,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.fields1993,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.step1993,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.fields1994,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.step1994,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.fields1995,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.step1995,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow202
