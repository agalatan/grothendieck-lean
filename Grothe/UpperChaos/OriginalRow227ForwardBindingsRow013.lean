import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013
import Grothe.UpperChaos.OriginalRow227TriangleForward0191
import Grothe.UpperChaos.OriginalRow227TriangleForward0192
import Grothe.UpperChaos.OriginalRow227TriangleForward0193
import Grothe.UpperChaos.OriginalRow227TriangleForward0194
import Grothe.UpperChaos.OriginalRow227TriangleForward0195
import Grothe.UpperChaos.OriginalRow227TriangleForward0196
import Grothe.UpperChaos.OriginalRow227TriangleForward0197
import Grothe.UpperChaos.OriginalRow227TriangleForward0198
import Grothe.UpperChaos.OriginalRow227TriangleForward0199
import Grothe.UpperChaos.OriginalRow227TriangleForward0200
import Grothe.UpperChaos.OriginalRow227TriangleForward0201
import Grothe.UpperChaos.OriginalRow227TriangleForward0202
import Grothe.UpperChaos.OriginalRow227TriangleForward0203
import Grothe.UpperChaos.OriginalRow227TriangleForward0204
import Grothe.UpperChaos.OriginalRow227TriangleForward0205

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0191 : OriginalRow227TriangleForward0191.entries.size = 32 := rfl

def entry0191 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0191.entries[i.val]'(by rw [size0191]; exact i.isLt)

theorem fields0191 (i : Fin 32) :
    (entry0191 i).IA = shift ∧ (entry0191 i).ID = S (12 + i.val + 1) ∧
      (entry0191 i).IC = S 13 ∧ (entry0191 i).Inext = T 12 (12 + i.val + 1) ∧
      (entry0191 i).Icur = T 12 (12 + i.val) ∧
      (entry0191 i).output = T 13 (12 + i.val) ∧
      (entry0191 i).charge = charge 12 (12 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0191 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (12 + i.val)) shift
      (S (12 + i.val + 1)) (S 13) (T 12 (12 + i.val + 1))
      (T 12 (12 + i.val)) (T 13 (12 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0191.entries OriginalRow227TriangleForward0191.checked
    ⟨i.val, by rw [size0191]; exact i.isLt⟩
  change (entry0191 i).check = true at h
  rcases fields0191 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0192 : OriginalRow227TriangleForward0192.entries.size = 32 := rfl

def entry0192 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0192.entries[i.val]'(by rw [size0192]; exact i.isLt)

theorem fields0192 (i : Fin 32) :
    (entry0192 i).IA = shift ∧ (entry0192 i).ID = S (44 + i.val + 1) ∧
      (entry0192 i).IC = S 13 ∧ (entry0192 i).Inext = T 12 (44 + i.val + 1) ∧
      (entry0192 i).Icur = T 12 (44 + i.val) ∧
      (entry0192 i).output = T 13 (44 + i.val) ∧
      (entry0192 i).charge = charge 12 (44 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0192 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (44 + i.val)) shift
      (S (44 + i.val + 1)) (S 13) (T 12 (44 + i.val + 1))
      (T 12 (44 + i.val)) (T 13 (44 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0192.entries OriginalRow227TriangleForward0192.checked
    ⟨i.val, by rw [size0192]; exact i.isLt⟩
  change (entry0192 i).check = true at h
  rcases fields0192 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0193 : OriginalRow227TriangleForward0193.entries.size = 32 := rfl

def entry0193 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0193.entries[i.val]'(by rw [size0193]; exact i.isLt)

theorem fields0193 (i : Fin 32) :
    (entry0193 i).IA = shift ∧ (entry0193 i).ID = S (76 + i.val + 1) ∧
      (entry0193 i).IC = S 13 ∧ (entry0193 i).Inext = T 12 (76 + i.val + 1) ∧
      (entry0193 i).Icur = T 12 (76 + i.val) ∧
      (entry0193 i).output = T 13 (76 + i.val) ∧
      (entry0193 i).charge = charge 12 (76 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0193 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (76 + i.val)) shift
      (S (76 + i.val + 1)) (S 13) (T 12 (76 + i.val + 1))
      (T 12 (76 + i.val)) (T 13 (76 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0193.entries OriginalRow227TriangleForward0193.checked
    ⟨i.val, by rw [size0193]; exact i.isLt⟩
  change (entry0193 i).check = true at h
  rcases fields0193 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0194 : OriginalRow227TriangleForward0194.entries.size = 32 := rfl

def entry0194 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0194.entries[i.val]'(by rw [size0194]; exact i.isLt)

theorem fields0194 (i : Fin 32) :
    (entry0194 i).IA = shift ∧ (entry0194 i).ID = S (108 + i.val + 1) ∧
      (entry0194 i).IC = S 13 ∧ (entry0194 i).Inext = T 12 (108 + i.val + 1) ∧
      (entry0194 i).Icur = T 12 (108 + i.val) ∧
      (entry0194 i).output = T 13 (108 + i.val) ∧
      (entry0194 i).charge = charge 12 (108 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0194 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (108 + i.val)) shift
      (S (108 + i.val + 1)) (S 13) (T 12 (108 + i.val + 1))
      (T 12 (108 + i.val)) (T 13 (108 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0194.entries OriginalRow227TriangleForward0194.checked
    ⟨i.val, by rw [size0194]; exact i.isLt⟩
  change (entry0194 i).check = true at h
  rcases fields0194 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0195 : OriginalRow227TriangleForward0195.entries.size = 32 := rfl

def entry0195 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0195.entries[i.val]'(by rw [size0195]; exact i.isLt)

theorem fields0195 (i : Fin 32) :
    (entry0195 i).IA = shift ∧ (entry0195 i).ID = S (140 + i.val + 1) ∧
      (entry0195 i).IC = S 13 ∧ (entry0195 i).Inext = T 12 (140 + i.val + 1) ∧
      (entry0195 i).Icur = T 12 (140 + i.val) ∧
      (entry0195 i).output = T 13 (140 + i.val) ∧
      (entry0195 i).charge = charge 12 (140 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0195 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (140 + i.val)) shift
      (S (140 + i.val + 1)) (S 13) (T 12 (140 + i.val + 1))
      (T 12 (140 + i.val)) (T 13 (140 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0195.entries OriginalRow227TriangleForward0195.checked
    ⟨i.val, by rw [size0195]; exact i.isLt⟩
  change (entry0195 i).check = true at h
  rcases fields0195 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0196 : OriginalRow227TriangleForward0196.entries.size = 32 := rfl

def entry0196 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0196.entries[i.val]'(by rw [size0196]; exact i.isLt)

theorem fields0196 (i : Fin 32) :
    (entry0196 i).IA = shift ∧ (entry0196 i).ID = S (172 + i.val + 1) ∧
      (entry0196 i).IC = S 13 ∧ (entry0196 i).Inext = T 12 (172 + i.val + 1) ∧
      (entry0196 i).Icur = T 12 (172 + i.val) ∧
      (entry0196 i).output = T 13 (172 + i.val) ∧
      (entry0196 i).charge = charge 12 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0196 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 13) (T 12 (172 + i.val + 1))
      (T 12 (172 + i.val)) (T 13 (172 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0196.entries OriginalRow227TriangleForward0196.checked
    ⟨i.val, by rw [size0196]; exact i.isLt⟩
  change (entry0196 i).check = true at h
  rcases fields0196 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0197 : OriginalRow227TriangleForward0197.entries.size = 32 := rfl

def entry0197 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0197.entries[i.val]'(by rw [size0197]; exact i.isLt)

theorem fields0197 (i : Fin 32) :
    (entry0197 i).IA = shift ∧ (entry0197 i).ID = S (204 + i.val + 1) ∧
      (entry0197 i).IC = S 13 ∧ (entry0197 i).Inext = T 12 (204 + i.val + 1) ∧
      (entry0197 i).Icur = T 12 (204 + i.val) ∧
      (entry0197 i).output = T 13 (204 + i.val) ∧
      (entry0197 i).charge = charge 12 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0197 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 13) (T 12 (204 + i.val + 1))
      (T 12 (204 + i.val)) (T 13 (204 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0197.entries OriginalRow227TriangleForward0197.checked
    ⟨i.val, by rw [size0197]; exact i.isLt⟩
  change (entry0197 i).check = true at h
  rcases fields0197 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0198 : OriginalRow227TriangleForward0198.entries.size = 32 := rfl

def entry0198 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0198.entries[i.val]'(by rw [size0198]; exact i.isLt)

theorem fields0198 (i : Fin 32) :
    (entry0198 i).IA = shift ∧ (entry0198 i).ID = S (236 + i.val + 1) ∧
      (entry0198 i).IC = S 13 ∧ (entry0198 i).Inext = T 12 (236 + i.val + 1) ∧
      (entry0198 i).Icur = T 12 (236 + i.val) ∧
      (entry0198 i).output = T 13 (236 + i.val) ∧
      (entry0198 i).charge = charge 12 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0198 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 13) (T 12 (236 + i.val + 1))
      (T 12 (236 + i.val)) (T 13 (236 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0198.entries OriginalRow227TriangleForward0198.checked
    ⟨i.val, by rw [size0198]; exact i.isLt⟩
  change (entry0198 i).check = true at h
  rcases fields0198 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0199 : OriginalRow227TriangleForward0199.entries.size = 32 := rfl

def entry0199 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0199.entries[i.val]'(by rw [size0199]; exact i.isLt)

theorem fields0199 (i : Fin 32) :
    (entry0199 i).IA = shift ∧ (entry0199 i).ID = S (268 + i.val + 1) ∧
      (entry0199 i).IC = S 13 ∧ (entry0199 i).Inext = T 12 (268 + i.val + 1) ∧
      (entry0199 i).Icur = T 12 (268 + i.val) ∧
      (entry0199 i).output = T 13 (268 + i.val) ∧
      (entry0199 i).charge = charge 12 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0199 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 13) (T 12 (268 + i.val + 1))
      (T 12 (268 + i.val)) (T 13 (268 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0199.entries OriginalRow227TriangleForward0199.checked
    ⟨i.val, by rw [size0199]; exact i.isLt⟩
  change (entry0199 i).check = true at h
  rcases fields0199 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0200 : OriginalRow227TriangleForward0200.entries.size = 32 := rfl

def entry0200 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0200.entries[i.val]'(by rw [size0200]; exact i.isLt)

theorem fields0200 (i : Fin 32) :
    (entry0200 i).IA = shift ∧ (entry0200 i).ID = S (300 + i.val + 1) ∧
      (entry0200 i).IC = S 13 ∧ (entry0200 i).Inext = T 12 (300 + i.val + 1) ∧
      (entry0200 i).Icur = T 12 (300 + i.val) ∧
      (entry0200 i).output = T 13 (300 + i.val) ∧
      (entry0200 i).charge = charge 12 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0200 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 13) (T 12 (300 + i.val + 1))
      (T 12 (300 + i.val)) (T 13 (300 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0200.entries OriginalRow227TriangleForward0200.checked
    ⟨i.val, by rw [size0200]; exact i.isLt⟩
  change (entry0200 i).check = true at h
  rcases fields0200 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0201 : OriginalRow227TriangleForward0201.entries.size = 32 := rfl

def entry0201 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0201.entries[i.val]'(by rw [size0201]; exact i.isLt)

theorem fields0201 (i : Fin 32) :
    (entry0201 i).IA = shift ∧ (entry0201 i).ID = S (332 + i.val + 1) ∧
      (entry0201 i).IC = S 13 ∧ (entry0201 i).Inext = T 12 (332 + i.val + 1) ∧
      (entry0201 i).Icur = T 12 (332 + i.val) ∧
      (entry0201 i).output = T 13 (332 + i.val) ∧
      (entry0201 i).charge = charge 12 (332 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0201 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (332 + i.val)) shift
      (S (332 + i.val + 1)) (S 13) (T 12 (332 + i.val + 1))
      (T 12 (332 + i.val)) (T 13 (332 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0201.entries OriginalRow227TriangleForward0201.checked
    ⟨i.val, by rw [size0201]; exact i.isLt⟩
  change (entry0201 i).check = true at h
  rcases fields0201 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0202 : OriginalRow227TriangleForward0202.entries.size = 32 := rfl

def entry0202 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0202.entries[i.val]'(by rw [size0202]; exact i.isLt)

theorem fields0202 (i : Fin 32) :
    (entry0202 i).IA = shift ∧ (entry0202 i).ID = S (364 + i.val + 1) ∧
      (entry0202 i).IC = S 13 ∧ (entry0202 i).Inext = T 12 (364 + i.val + 1) ∧
      (entry0202 i).Icur = T 12 (364 + i.val) ∧
      (entry0202 i).output = T 13 (364 + i.val) ∧
      (entry0202 i).charge = charge 12 (364 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0202 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (364 + i.val)) shift
      (S (364 + i.val + 1)) (S 13) (T 12 (364 + i.val + 1))
      (T 12 (364 + i.val)) (T 13 (364 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0202.entries OriginalRow227TriangleForward0202.checked
    ⟨i.val, by rw [size0202]; exact i.isLt⟩
  change (entry0202 i).check = true at h
  rcases fields0202 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0203 : OriginalRow227TriangleForward0203.entries.size = 32 := rfl

def entry0203 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0203.entries[i.val]'(by rw [size0203]; exact i.isLt)

theorem fields0203 (i : Fin 32) :
    (entry0203 i).IA = shift ∧ (entry0203 i).ID = S (396 + i.val + 1) ∧
      (entry0203 i).IC = S 13 ∧ (entry0203 i).Inext = T 12 (396 + i.val + 1) ∧
      (entry0203 i).Icur = T 12 (396 + i.val) ∧
      (entry0203 i).output = T 13 (396 + i.val) ∧
      (entry0203 i).charge = charge 12 (396 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0203 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (396 + i.val)) shift
      (S (396 + i.val + 1)) (S 13) (T 12 (396 + i.val + 1))
      (T 12 (396 + i.val)) (T 13 (396 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0203.entries OriginalRow227TriangleForward0203.checked
    ⟨i.val, by rw [size0203]; exact i.isLt⟩
  change (entry0203 i).check = true at h
  rcases fields0203 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0204 : OriginalRow227TriangleForward0204.entries.size = 32 := rfl

def entry0204 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0204.entries[i.val]'(by rw [size0204]; exact i.isLt)

theorem fields0204 (i : Fin 32) :
    (entry0204 i).IA = shift ∧ (entry0204 i).ID = S (428 + i.val + 1) ∧
      (entry0204 i).IC = S 13 ∧ (entry0204 i).Inext = T 12 (428 + i.val + 1) ∧
      (entry0204 i).Icur = T 12 (428 + i.val) ∧
      (entry0204 i).output = T 13 (428 + i.val) ∧
      (entry0204 i).charge = charge 12 (428 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0204 (i : Fin 32) :
    forwardStepOK (-768) (charge 12 (428 + i.val)) shift
      (S (428 + i.val + 1)) (S 13) (T 12 (428 + i.val + 1))
      (T 12 (428 + i.val)) (T 13 (428 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0204.entries OriginalRow227TriangleForward0204.checked
    ⟨i.val, by rw [size0204]; exact i.isLt⟩
  change (entry0204 i).check = true at h
  rcases fields0204 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0205 : OriginalRow227TriangleForward0205.entries.size = 29 := rfl

def entry0205 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0205.entries[i.val]'(by rw [size0205]; exact i.isLt)

theorem fields0205 (i : Fin 29) :
    (entry0205 i).IA = shift ∧ (entry0205 i).ID = S (460 + i.val + 1) ∧
      (entry0205 i).IC = S 13 ∧ (entry0205 i).Inext = T 12 (460 + i.val + 1) ∧
      (entry0205 i).Icur = T 12 (460 + i.val) ∧
      (entry0205 i).output = T 13 (460 + i.val) ∧
      (entry0205 i).charge = charge 12 (460 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨28, by decide⟩).symm, rfl⟩

theorem step0205 (i : Fin 29) :
    forwardStepOK (-768) (charge 12 (460 + i.val)) shift
      (S (460 + i.val + 1)) (S 13) (T 12 (460 + i.val + 1))
      (T 12 (460 + i.val)) (T 13 (460 + i.val))
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0205.entries OriginalRow227TriangleForward0205.checked
    ⟨i.val, by rw [size0205]; exact i.isLt⟩
  change (entry0205 i).check = true at h
  rcases fields0205 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 12 ≤ d) (hhi : d < 489) :
    forwardStepOK (-768) (charge 12 d) shift (S (d + 1)) (S 13)
      (T 12 (d + 1)) (T 12 d) (T 13 d)
      (OriginalRow227Roots.root_pos 13 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 12 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h108 : d < 108
    ·
      by_cases h44 : d < 44
      ·
        have hi : d - 12 < 32 := by omega
        have heq : 12 + (d - 12) = d := by omega
        simpa only [heq] using step0191 ⟨d - 12, hi⟩
      ·
        by_cases h76 : d < 76
        ·
          have hi : d - 44 < 32 := by omega
          have heq : 44 + (d - 44) = d := by omega
          simpa only [heq] using step0192 ⟨d - 44, hi⟩
        ·
          have hi : d - 76 < 32 := by omega
          have heq : 76 + (d - 76) = d := by omega
          simpa only [heq] using step0193 ⟨d - 76, hi⟩
    ·
      by_cases h172 : d < 172
      ·
        by_cases h140 : d < 140
        ·
          have hi : d - 108 < 32 := by omega
          have heq : 108 + (d - 108) = d := by omega
          simpa only [heq] using step0194 ⟨d - 108, hi⟩
        ·
          have hi : d - 140 < 32 := by omega
          have heq : 140 + (d - 140) = d := by omega
          simpa only [heq] using step0195 ⟨d - 140, hi⟩
      ·
        by_cases h204 : d < 204
        ·
          have hi : d - 172 < 32 := by omega
          have heq : 172 + (d - 172) = d := by omega
          simpa only [heq] using step0196 ⟨d - 172, hi⟩
        ·
          have hi : d - 204 < 32 := by omega
          have heq : 204 + (d - 204) = d := by omega
          simpa only [heq] using step0197 ⟨d - 204, hi⟩
  ·
    by_cases h364 : d < 364
    ·
      by_cases h300 : d < 300
      ·
        by_cases h268 : d < 268
        ·
          have hi : d - 236 < 32 := by omega
          have heq : 236 + (d - 236) = d := by omega
          simpa only [heq] using step0198 ⟨d - 236, hi⟩
        ·
          have hi : d - 268 < 32 := by omega
          have heq : 268 + (d - 268) = d := by omega
          simpa only [heq] using step0199 ⟨d - 268, hi⟩
      ·
        by_cases h332 : d < 332
        ·
          have hi : d - 300 < 32 := by omega
          have heq : 300 + (d - 300) = d := by omega
          simpa only [heq] using step0200 ⟨d - 300, hi⟩
        ·
          have hi : d - 332 < 32 := by omega
          have heq : 332 + (d - 332) = d := by omega
          simpa only [heq] using step0201 ⟨d - 332, hi⟩
    ·
      by_cases h428 : d < 428
      ·
        by_cases h396 : d < 396
        ·
          have hi : d - 364 < 32 := by omega
          have heq : 364 + (d - 364) = d := by omega
          simpa only [heq] using step0202 ⟨d - 364, hi⟩
        ·
          have hi : d - 396 < 32 := by omega
          have heq : 396 + (d - 396) = d := by omega
          simpa only [heq] using step0203 ⟨d - 396, hi⟩
      ·
        by_cases h460 : d < 460
        ·
          have hi : d - 428 < 32 := by omega
          have heq : 428 + (d - 428) = d := by omega
          simpa only [heq] using step0204 ⟨d - 428, hi⟩
        ·
          have hi : d - 460 < 29 := by omega
          have heq : 460 + (d - 460) = d := by omega
          simpa only [heq] using step0205 ⟨d - 460, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0191,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0191,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0192,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0192,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0193,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0193,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0194,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0194,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0195,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0195,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0196,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0196,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0197,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0197,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0198,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0198,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0199,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0199,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0200,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0200,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0201,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0201,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0202,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0202,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0203,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0203,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0204,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0204,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.fields0205,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.step0205,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow013
