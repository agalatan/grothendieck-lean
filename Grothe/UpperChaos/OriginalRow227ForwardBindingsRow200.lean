import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200
import Grothe.UpperChaos.OriginalRow227TriangleForward1984
import Grothe.UpperChaos.OriginalRow227TriangleForward1985
import Grothe.UpperChaos.OriginalRow227TriangleForward1986
import Grothe.UpperChaos.OriginalRow227TriangleForward1987

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1984 : OriginalRow227TriangleForward1984.entries.size = 32 := rfl

def entry1984 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1984.entries[i.val]'(by rw [size1984]; exact i.isLt)

theorem fields1984 (i : Fin 32) :
    (entry1984 i).IA = shift ∧ (entry1984 i).ID = S (199 + i.val + 1) ∧
      (entry1984 i).IC = S 200 ∧ (entry1984 i).Inext = T 199 (199 + i.val + 1) ∧
      (entry1984 i).Icur = T 199 (199 + i.val) ∧
      (entry1984 i).output = T 200 (199 + i.val) ∧
      (entry1984 i).charge = charge 199 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1996_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2000_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1984 (i : Fin 32) :
    forwardStepOK (-768) (charge 199 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 200) (T 199 (199 + i.val + 1))
      (T 199 (199 + i.val)) (T 200 (199 + i.val))
      (OriginalRow227Roots.root_pos 200 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 199 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1984.entries OriginalRow227TriangleForward1984.checked
    ⟨i.val, by rw [size1984]; exact i.isLt⟩
  change (entry1984 i).check = true at h
  rcases fields1984 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1985 : OriginalRow227TriangleForward1985.entries.size = 32 := rfl

def entry1985 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1985.entries[i.val]'(by rw [size1985]; exact i.isLt)

theorem fields1985 (i : Fin 32) :
    (entry1985 i).IA = shift ∧ (entry1985 i).ID = S (231 + i.val + 1) ∧
      (entry1985 i).IC = S 200 ∧ (entry1985 i).Inext = T 199 (231 + i.val + 1) ∧
      (entry1985 i).Icur = T 199 (231 + i.val) ∧
      (entry1985 i).output = T 200 (231 + i.val) ∧
      (entry1985 i).charge = charge 199 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1997_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2001_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1985 (i : Fin 32) :
    forwardStepOK (-768) (charge 199 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 200) (T 199 (231 + i.val + 1))
      (T 199 (231 + i.val)) (T 200 (231 + i.val))
      (OriginalRow227Roots.root_pos 200 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 199 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1985.entries OriginalRow227TriangleForward1985.checked
    ⟨i.val, by rw [size1985]; exact i.isLt⟩
  change (entry1985 i).check = true at h
  rcases fields1985 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1986 : OriginalRow227TriangleForward1986.entries.size = 32 := rfl

def entry1986 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1986.entries[i.val]'(by rw [size1986]; exact i.isLt)

theorem fields1986 (i : Fin 32) :
    (entry1986 i).IA = shift ∧ (entry1986 i).ID = S (263 + i.val + 1) ∧
      (entry1986 i).IC = S 200 ∧ (entry1986 i).Inext = T 199 (263 + i.val + 1) ∧
      (entry1986 i).Icur = T 199 (263 + i.val) ∧
      (entry1986 i).output = T 200 (263 + i.val) ∧
      (entry1986 i).charge = charge 199 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1998_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2002_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1986 (i : Fin 32) :
    forwardStepOK (-768) (charge 199 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 200) (T 199 (263 + i.val + 1))
      (T 199 (263 + i.val)) (T 200 (263 + i.val))
      (OriginalRow227Roots.root_pos 200 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 199 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1986.entries OriginalRow227TriangleForward1986.checked
    ⟨i.val, by rw [size1986]; exact i.isLt⟩
  change (entry1986 i).check = true at h
  rcases fields1986 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1987 : OriginalRow227TriangleForward1987.entries.size = 7 := rfl

def entry1987 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1987.entries[i.val]'(by rw [size1987]; exact i.isLt)

theorem fields1987 (i : Fin 7) :
    (entry1987 i).IA = shift ∧ (entry1987 i).ID = S (295 + i.val + 1) ∧
      (entry1987 i).IC = S 200 ∧ (entry1987 i).Inext = T 199 (295 + i.val + 1) ∧
      (entry1987 i).Icur = T 199 (295 + i.val) ∧
      (entry1987 i).output = T 200 (295 + i.val) ∧
      (entry1987 i).charge = charge 199 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow199.block1999_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow200.block2003_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1987 (i : Fin 7) :
    forwardStepOK (-768) (charge 199 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 200) (T 199 (295 + i.val + 1))
      (T 199 (295 + i.val)) (T 200 (295 + i.val))
      (OriginalRow227Roots.root_pos 200 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 199 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1987.entries OriginalRow227TriangleForward1987.checked
    ⟨i.val, by rw [size1987]; exact i.isLt⟩
  change (entry1987 i).check = true at h
  rcases fields1987 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 199 ≤ d) (hhi : d < 302) :
    forwardStepOK (-768) (charge 199 d) shift (S (d + 1)) (S 200)
      (T 199 (d + 1)) (T 199 d) (T 200 d)
      (OriginalRow227Roots.root_pos 200 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 199 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h231 : d < 231
    ·
      have hi : d - 199 < 32 := by omega
      have heq : 199 + (d - 199) = d := by omega
      simpa only [heq] using step1984 ⟨d - 199, hi⟩
    ·
      have hi : d - 231 < 32 := by omega
      have heq : 231 + (d - 231) = d := by omega
      simpa only [heq] using step1985 ⟨d - 231, hi⟩
  ·
    by_cases h295 : d < 295
    ·
      have hi : d - 263 < 32 := by omega
      have heq : 263 + (d - 263) = d := by omega
      simpa only [heq] using step1986 ⟨d - 263, hi⟩
    ·
      have hi : d - 295 < 7 := by omega
      have heq : 295 + (d - 295) = d := by omega
      simpa only [heq] using step1987 ⟨d - 295, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.fields1984,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.step1984,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.fields1985,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.step1985,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.fields1986,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.step1986,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.fields1987,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.step1987,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow200
