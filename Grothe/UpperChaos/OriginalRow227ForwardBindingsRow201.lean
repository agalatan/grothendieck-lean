import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201
import Grothe.UpperChaos.OriginalRow227TriangleForward1988
import Grothe.UpperChaos.OriginalRow227TriangleForward1989
import Grothe.UpperChaos.OriginalRow227TriangleForward1990
import Grothe.UpperChaos.OriginalRow227TriangleForward1991

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1988 : OriginalRow227TriangleForward1988.entries.size = 32 := rfl

def entry1988 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1988.entries[i.val]'(by rw [size1988]; exact i.isLt)

theorem fields1988 (i : Fin 32) :
    (entry1988 i).IA = shift ∧ (entry1988 i).ID = S (200 + i.val + 1) ∧
      (entry1988 i).IC = S 201 ∧ (entry1988 i).Inext = T 200 (200 + i.val + 1) ∧
      (entry1988 i).Icur = T 200 (200 + i.val) ∧
      (entry1988 i).output = T 201 (200 + i.val) ∧
      (entry1988 i).charge = charge 200 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2004_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1988 (i : Fin 32) :
    forwardStepOK (-768) (charge 200 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 201) (T 200 (200 + i.val + 1))
      (T 200 (200 + i.val)) (T 201 (200 + i.val))
      (OriginalRow227Roots.root_pos 201 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 200 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1988.entries OriginalRow227TriangleForward1988.checked
    ⟨i.val, by rw [size1988]; exact i.isLt⟩
  change (entry1988 i).check = true at h
  rcases fields1988 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1989 : OriginalRow227TriangleForward1989.entries.size = 32 := rfl

def entry1989 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1989.entries[i.val]'(by rw [size1989]; exact i.isLt)

theorem fields1989 (i : Fin 32) :
    (entry1989 i).IA = shift ∧ (entry1989 i).ID = S (232 + i.val + 1) ∧
      (entry1989 i).IC = S 201 ∧ (entry1989 i).Inext = T 200 (232 + i.val + 1) ∧
      (entry1989 i).Icur = T 200 (232 + i.val) ∧
      (entry1989 i).output = T 201 (232 + i.val) ∧
      (entry1989 i).charge = charge 200 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2005_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1989 (i : Fin 32) :
    forwardStepOK (-768) (charge 200 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 201) (T 200 (232 + i.val + 1))
      (T 200 (232 + i.val)) (T 201 (232 + i.val))
      (OriginalRow227Roots.root_pos 201 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 200 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1989.entries OriginalRow227TriangleForward1989.checked
    ⟨i.val, by rw [size1989]; exact i.isLt⟩
  change (entry1989 i).check = true at h
  rcases fields1989 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1990 : OriginalRow227TriangleForward1990.entries.size = 32 := rfl

def entry1990 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1990.entries[i.val]'(by rw [size1990]; exact i.isLt)

theorem fields1990 (i : Fin 32) :
    (entry1990 i).IA = shift ∧ (entry1990 i).ID = S (264 + i.val + 1) ∧
      (entry1990 i).IC = S 201 ∧ (entry1990 i).Inext = T 200 (264 + i.val + 1) ∧
      (entry1990 i).Icur = T 200 (264 + i.val) ∧
      (entry1990 i).output = T 201 (264 + i.val) ∧
      (entry1990 i).charge = charge 200 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2006_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1990 (i : Fin 32) :
    forwardStepOK (-768) (charge 200 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 201) (T 200 (264 + i.val + 1))
      (T 200 (264 + i.val)) (T 201 (264 + i.val))
      (OriginalRow227Roots.root_pos 201 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 200 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1990.entries OriginalRow227TriangleForward1990.checked
    ⟨i.val, by rw [size1990]; exact i.isLt⟩
  change (entry1990 i).check = true at h
  rcases fields1990 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1991 : OriginalRow227TriangleForward1991.entries.size = 5 := rfl

def entry1991 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1991.entries[i.val]'(by rw [size1991]; exact i.isLt)

theorem fields1991 (i : Fin 5) :
    (entry1991 i).IA = shift ∧ (entry1991 i).ID = S (296 + i.val + 1) ∧
      (entry1991 i).IC = S 201 ∧ (entry1991 i).Inext = T 200 (296 + i.val + 1) ∧
      (entry1991 i).Icur = T 200 (296 + i.val) ∧
      (entry1991 i).output = T 201 (296 + i.val) ∧
      (entry1991 i).charge = charge 200 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow201.block2007_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1991 (i : Fin 5) :
    forwardStepOK (-768) (charge 200 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 201) (T 200 (296 + i.val + 1))
      (T 200 (296 + i.val)) (T 201 (296 + i.val))
      (OriginalRow227Roots.root_pos 201 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 200 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1991.entries OriginalRow227TriangleForward1991.checked
    ⟨i.val, by rw [size1991]; exact i.isLt⟩
  change (entry1991 i).check = true at h
  rcases fields1991 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 200 ≤ d) (hhi : d < 301) :
    forwardStepOK (-768) (charge 200 d) shift (S (d + 1)) (S 201)
      (T 200 (d + 1)) (T 200 d) (T 201 d)
      (OriginalRow227Roots.root_pos 201 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 200 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h232 : d < 232
    ·
      have hi : d - 200 < 32 := by omega
      have heq : 200 + (d - 200) = d := by omega
      simpa only [heq] using step1988 ⟨d - 200, hi⟩
    ·
      have hi : d - 232 < 32 := by omega
      have heq : 232 + (d - 232) = d := by omega
      simpa only [heq] using step1989 ⟨d - 232, hi⟩
  ·
    by_cases h296 : d < 296
    ·
      have hi : d - 264 < 32 := by omega
      have heq : 264 + (d - 264) = d := by omega
      simpa only [heq] using step1990 ⟨d - 264, hi⟩
    ·
      have hi : d - 296 < 5 := by omega
      have heq : 296 + (d - 296) = d := by omega
      simpa only [heq] using step1991 ⟨d - 296, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.fields1988,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.step1988,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.fields1989,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.step1989,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.fields1990,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.step1990,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.fields1991,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.step1991,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow201
