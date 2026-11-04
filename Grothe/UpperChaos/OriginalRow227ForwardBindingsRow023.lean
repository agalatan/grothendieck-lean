import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023
import Grothe.UpperChaos.OriginalRow227TriangleForward0341
import Grothe.UpperChaos.OriginalRow227TriangleForward0342
import Grothe.UpperChaos.OriginalRow227TriangleForward0343
import Grothe.UpperChaos.OriginalRow227TriangleForward0344
import Grothe.UpperChaos.OriginalRow227TriangleForward0345
import Grothe.UpperChaos.OriginalRow227TriangleForward0346
import Grothe.UpperChaos.OriginalRow227TriangleForward0347
import Grothe.UpperChaos.OriginalRow227TriangleForward0348
import Grothe.UpperChaos.OriginalRow227TriangleForward0349
import Grothe.UpperChaos.OriginalRow227TriangleForward0350
import Grothe.UpperChaos.OriginalRow227TriangleForward0351
import Grothe.UpperChaos.OriginalRow227TriangleForward0352
import Grothe.UpperChaos.OriginalRow227TriangleForward0353
import Grothe.UpperChaos.OriginalRow227TriangleForward0354
import Grothe.UpperChaos.OriginalRow227TriangleForward0355

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0341 : OriginalRow227TriangleForward0341.entries.size = 32 := rfl

def entry0341 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0341.entries[i.val]'(by rw [size0341]; exact i.isLt)

theorem fields0341 (i : Fin 32) :
    (entry0341 i).IA = shift ∧ (entry0341 i).ID = S (22 + i.val + 1) ∧
      (entry0341 i).IC = S 23 ∧ (entry0341 i).Inext = T 22 (22 + i.val + 1) ∧
      (entry0341 i).Icur = T 22 (22 + i.val) ∧
      (entry0341 i).output = T 23 (22 + i.val) ∧
      (entry0341 i).charge = charge 22 (22 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0341 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (22 + i.val)) shift
      (S (22 + i.val + 1)) (S 23) (T 22 (22 + i.val + 1))
      (T 22 (22 + i.val)) (T 23 (22 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0341.entries OriginalRow227TriangleForward0341.checked
    ⟨i.val, by rw [size0341]; exact i.isLt⟩
  change (entry0341 i).check = true at h
  rcases fields0341 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0342 : OriginalRow227TriangleForward0342.entries.size = 32 := rfl

def entry0342 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0342.entries[i.val]'(by rw [size0342]; exact i.isLt)

theorem fields0342 (i : Fin 32) :
    (entry0342 i).IA = shift ∧ (entry0342 i).ID = S (54 + i.val + 1) ∧
      (entry0342 i).IC = S 23 ∧ (entry0342 i).Inext = T 22 (54 + i.val + 1) ∧
      (entry0342 i).Icur = T 22 (54 + i.val) ∧
      (entry0342 i).output = T 23 (54 + i.val) ∧
      (entry0342 i).charge = charge 22 (54 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0342 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (54 + i.val)) shift
      (S (54 + i.val + 1)) (S 23) (T 22 (54 + i.val + 1))
      (T 22 (54 + i.val)) (T 23 (54 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0342.entries OriginalRow227TriangleForward0342.checked
    ⟨i.val, by rw [size0342]; exact i.isLt⟩
  change (entry0342 i).check = true at h
  rcases fields0342 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0343 : OriginalRow227TriangleForward0343.entries.size = 32 := rfl

def entry0343 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0343.entries[i.val]'(by rw [size0343]; exact i.isLt)

theorem fields0343 (i : Fin 32) :
    (entry0343 i).IA = shift ∧ (entry0343 i).ID = S (86 + i.val + 1) ∧
      (entry0343 i).IC = S 23 ∧ (entry0343 i).Inext = T 22 (86 + i.val + 1) ∧
      (entry0343 i).Icur = T 22 (86 + i.val) ∧
      (entry0343 i).output = T 23 (86 + i.val) ∧
      (entry0343 i).charge = charge 22 (86 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0343 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (86 + i.val)) shift
      (S (86 + i.val + 1)) (S 23) (T 22 (86 + i.val + 1))
      (T 22 (86 + i.val)) (T 23 (86 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0343.entries OriginalRow227TriangleForward0343.checked
    ⟨i.val, by rw [size0343]; exact i.isLt⟩
  change (entry0343 i).check = true at h
  rcases fields0343 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0344 : OriginalRow227TriangleForward0344.entries.size = 32 := rfl

def entry0344 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0344.entries[i.val]'(by rw [size0344]; exact i.isLt)

theorem fields0344 (i : Fin 32) :
    (entry0344 i).IA = shift ∧ (entry0344 i).ID = S (118 + i.val + 1) ∧
      (entry0344 i).IC = S 23 ∧ (entry0344 i).Inext = T 22 (118 + i.val + 1) ∧
      (entry0344 i).Icur = T 22 (118 + i.val) ∧
      (entry0344 i).output = T 23 (118 + i.val) ∧
      (entry0344 i).charge = charge 22 (118 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0344 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (118 + i.val)) shift
      (S (118 + i.val + 1)) (S 23) (T 22 (118 + i.val + 1))
      (T 22 (118 + i.val)) (T 23 (118 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0344.entries OriginalRow227TriangleForward0344.checked
    ⟨i.val, by rw [size0344]; exact i.isLt⟩
  change (entry0344 i).check = true at h
  rcases fields0344 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0345 : OriginalRow227TriangleForward0345.entries.size = 32 := rfl

def entry0345 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0345.entries[i.val]'(by rw [size0345]; exact i.isLt)

theorem fields0345 (i : Fin 32) :
    (entry0345 i).IA = shift ∧ (entry0345 i).ID = S (150 + i.val + 1) ∧
      (entry0345 i).IC = S 23 ∧ (entry0345 i).Inext = T 22 (150 + i.val + 1) ∧
      (entry0345 i).Icur = T 22 (150 + i.val) ∧
      (entry0345 i).output = T 23 (150 + i.val) ∧
      (entry0345 i).charge = charge 22 (150 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0345 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (150 + i.val)) shift
      (S (150 + i.val + 1)) (S 23) (T 22 (150 + i.val + 1))
      (T 22 (150 + i.val)) (T 23 (150 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0345.entries OriginalRow227TriangleForward0345.checked
    ⟨i.val, by rw [size0345]; exact i.isLt⟩
  change (entry0345 i).check = true at h
  rcases fields0345 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0346 : OriginalRow227TriangleForward0346.entries.size = 32 := rfl

def entry0346 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0346.entries[i.val]'(by rw [size0346]; exact i.isLt)

theorem fields0346 (i : Fin 32) :
    (entry0346 i).IA = shift ∧ (entry0346 i).ID = S (182 + i.val + 1) ∧
      (entry0346 i).IC = S 23 ∧ (entry0346 i).Inext = T 22 (182 + i.val + 1) ∧
      (entry0346 i).Icur = T 22 (182 + i.val) ∧
      (entry0346 i).output = T 23 (182 + i.val) ∧
      (entry0346 i).charge = charge 22 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0346 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 23) (T 22 (182 + i.val + 1))
      (T 22 (182 + i.val)) (T 23 (182 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0346.entries OriginalRow227TriangleForward0346.checked
    ⟨i.val, by rw [size0346]; exact i.isLt⟩
  change (entry0346 i).check = true at h
  rcases fields0346 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0347 : OriginalRow227TriangleForward0347.entries.size = 32 := rfl

def entry0347 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0347.entries[i.val]'(by rw [size0347]; exact i.isLt)

theorem fields0347 (i : Fin 32) :
    (entry0347 i).IA = shift ∧ (entry0347 i).ID = S (214 + i.val + 1) ∧
      (entry0347 i).IC = S 23 ∧ (entry0347 i).Inext = T 22 (214 + i.val + 1) ∧
      (entry0347 i).Icur = T 22 (214 + i.val) ∧
      (entry0347 i).output = T 23 (214 + i.val) ∧
      (entry0347 i).charge = charge 22 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0347 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 23) (T 22 (214 + i.val + 1))
      (T 22 (214 + i.val)) (T 23 (214 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0347.entries OriginalRow227TriangleForward0347.checked
    ⟨i.val, by rw [size0347]; exact i.isLt⟩
  change (entry0347 i).check = true at h
  rcases fields0347 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0348 : OriginalRow227TriangleForward0348.entries.size = 32 := rfl

def entry0348 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0348.entries[i.val]'(by rw [size0348]; exact i.isLt)

theorem fields0348 (i : Fin 32) :
    (entry0348 i).IA = shift ∧ (entry0348 i).ID = S (246 + i.val + 1) ∧
      (entry0348 i).IC = S 23 ∧ (entry0348 i).Inext = T 22 (246 + i.val + 1) ∧
      (entry0348 i).Icur = T 22 (246 + i.val) ∧
      (entry0348 i).output = T 23 (246 + i.val) ∧
      (entry0348 i).charge = charge 22 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0348 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 23) (T 22 (246 + i.val + 1))
      (T 22 (246 + i.val)) (T 23 (246 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0348.entries OriginalRow227TriangleForward0348.checked
    ⟨i.val, by rw [size0348]; exact i.isLt⟩
  change (entry0348 i).check = true at h
  rcases fields0348 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0349 : OriginalRow227TriangleForward0349.entries.size = 32 := rfl

def entry0349 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0349.entries[i.val]'(by rw [size0349]; exact i.isLt)

theorem fields0349 (i : Fin 32) :
    (entry0349 i).IA = shift ∧ (entry0349 i).ID = S (278 + i.val + 1) ∧
      (entry0349 i).IC = S 23 ∧ (entry0349 i).Inext = T 22 (278 + i.val + 1) ∧
      (entry0349 i).Icur = T 22 (278 + i.val) ∧
      (entry0349 i).output = T 23 (278 + i.val) ∧
      (entry0349 i).charge = charge 22 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0349 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 23) (T 22 (278 + i.val + 1))
      (T 22 (278 + i.val)) (T 23 (278 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0349.entries OriginalRow227TriangleForward0349.checked
    ⟨i.val, by rw [size0349]; exact i.isLt⟩
  change (entry0349 i).check = true at h
  rcases fields0349 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0350 : OriginalRow227TriangleForward0350.entries.size = 32 := rfl

def entry0350 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0350.entries[i.val]'(by rw [size0350]; exact i.isLt)

theorem fields0350 (i : Fin 32) :
    (entry0350 i).IA = shift ∧ (entry0350 i).ID = S (310 + i.val + 1) ∧
      (entry0350 i).IC = S 23 ∧ (entry0350 i).Inext = T 22 (310 + i.val + 1) ∧
      (entry0350 i).Icur = T 22 (310 + i.val) ∧
      (entry0350 i).output = T 23 (310 + i.val) ∧
      (entry0350 i).charge = charge 22 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0350 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 23) (T 22 (310 + i.val + 1))
      (T 22 (310 + i.val)) (T 23 (310 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0350.entries OriginalRow227TriangleForward0350.checked
    ⟨i.val, by rw [size0350]; exact i.isLt⟩
  change (entry0350 i).check = true at h
  rcases fields0350 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0351 : OriginalRow227TriangleForward0351.entries.size = 32 := rfl

def entry0351 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0351.entries[i.val]'(by rw [size0351]; exact i.isLt)

theorem fields0351 (i : Fin 32) :
    (entry0351 i).IA = shift ∧ (entry0351 i).ID = S (342 + i.val + 1) ∧
      (entry0351 i).IC = S 23 ∧ (entry0351 i).Inext = T 22 (342 + i.val + 1) ∧
      (entry0351 i).Icur = T 22 (342 + i.val) ∧
      (entry0351 i).output = T 23 (342 + i.val) ∧
      (entry0351 i).charge = charge 22 (342 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0351 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (342 + i.val)) shift
      (S (342 + i.val + 1)) (S 23) (T 22 (342 + i.val + 1))
      (T 22 (342 + i.val)) (T 23 (342 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0351.entries OriginalRow227TriangleForward0351.checked
    ⟨i.val, by rw [size0351]; exact i.isLt⟩
  change (entry0351 i).check = true at h
  rcases fields0351 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0352 : OriginalRow227TriangleForward0352.entries.size = 32 := rfl

def entry0352 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0352.entries[i.val]'(by rw [size0352]; exact i.isLt)

theorem fields0352 (i : Fin 32) :
    (entry0352 i).IA = shift ∧ (entry0352 i).ID = S (374 + i.val + 1) ∧
      (entry0352 i).IC = S 23 ∧ (entry0352 i).Inext = T 22 (374 + i.val + 1) ∧
      (entry0352 i).Icur = T 22 (374 + i.val) ∧
      (entry0352 i).output = T 23 (374 + i.val) ∧
      (entry0352 i).charge = charge 22 (374 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0352 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (374 + i.val)) shift
      (S (374 + i.val + 1)) (S 23) (T 22 (374 + i.val + 1))
      (T 22 (374 + i.val)) (T 23 (374 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0352.entries OriginalRow227TriangleForward0352.checked
    ⟨i.val, by rw [size0352]; exact i.isLt⟩
  change (entry0352 i).check = true at h
  rcases fields0352 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0353 : OriginalRow227TriangleForward0353.entries.size = 32 := rfl

def entry0353 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0353.entries[i.val]'(by rw [size0353]; exact i.isLt)

theorem fields0353 (i : Fin 32) :
    (entry0353 i).IA = shift ∧ (entry0353 i).ID = S (406 + i.val + 1) ∧
      (entry0353 i).IC = S 23 ∧ (entry0353 i).Inext = T 22 (406 + i.val + 1) ∧
      (entry0353 i).Icur = T 22 (406 + i.val) ∧
      (entry0353 i).output = T 23 (406 + i.val) ∧
      (entry0353 i).charge = charge 22 (406 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0353 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (406 + i.val)) shift
      (S (406 + i.val + 1)) (S 23) (T 22 (406 + i.val + 1))
      (T 22 (406 + i.val)) (T 23 (406 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0353.entries OriginalRow227TriangleForward0353.checked
    ⟨i.val, by rw [size0353]; exact i.isLt⟩
  change (entry0353 i).check = true at h
  rcases fields0353 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0354 : OriginalRow227TriangleForward0354.entries.size = 32 := rfl

def entry0354 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0354.entries[i.val]'(by rw [size0354]; exact i.isLt)

theorem fields0354 (i : Fin 32) :
    (entry0354 i).IA = shift ∧ (entry0354 i).ID = S (438 + i.val + 1) ∧
      (entry0354 i).IC = S 23 ∧ (entry0354 i).Inext = T 22 (438 + i.val + 1) ∧
      (entry0354 i).Icur = T 22 (438 + i.val) ∧
      (entry0354 i).output = T 23 (438 + i.val) ∧
      (entry0354 i).charge = charge 22 (438 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0354 (i : Fin 32) :
    forwardStepOK (-768) (charge 22 (438 + i.val)) shift
      (S (438 + i.val + 1)) (S 23) (T 22 (438 + i.val + 1))
      (T 22 (438 + i.val)) (T 23 (438 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0354.entries OriginalRow227TriangleForward0354.checked
    ⟨i.val, by rw [size0354]; exact i.isLt⟩
  change (entry0354 i).check = true at h
  rcases fields0354 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0355 : OriginalRow227TriangleForward0355.entries.size = 9 := rfl

def entry0355 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0355.entries[i.val]'(by rw [size0355]; exact i.isLt)

theorem fields0355 (i : Fin 9) :
    (entry0355 i).IA = shift ∧ (entry0355 i).ID = S (470 + i.val + 1) ∧
      (entry0355 i).IC = S 23 ∧ (entry0355 i).Inext = T 22 (470 + i.val + 1) ∧
      (entry0355 i).Icur = T 22 (470 + i.val) ∧
      (entry0355 i).output = T 23 (470 + i.val) ∧
      (entry0355 i).charge = charge 22 (470 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨8, by decide⟩).symm, rfl⟩

theorem step0355 (i : Fin 9) :
    forwardStepOK (-768) (charge 22 (470 + i.val)) shift
      (S (470 + i.val + 1)) (S 23) (T 22 (470 + i.val + 1))
      (T 22 (470 + i.val)) (T 23 (470 + i.val))
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0355.entries OriginalRow227TriangleForward0355.checked
    ⟨i.val, by rw [size0355]; exact i.isLt⟩
  change (entry0355 i).check = true at h
  rcases fields0355 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 22 ≤ d) (hhi : d < 479) :
    forwardStepOK (-768) (charge 22 d) shift (S (d + 1)) (S 23)
      (T 22 (d + 1)) (T 22 d) (T 23 d)
      (OriginalRow227Roots.root_pos 23 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 22 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h118 : d < 118
    ·
      by_cases h54 : d < 54
      ·
        have hi : d - 22 < 32 := by omega
        have heq : 22 + (d - 22) = d := by omega
        simpa only [heq] using step0341 ⟨d - 22, hi⟩
      ·
        by_cases h86 : d < 86
        ·
          have hi : d - 54 < 32 := by omega
          have heq : 54 + (d - 54) = d := by omega
          simpa only [heq] using step0342 ⟨d - 54, hi⟩
        ·
          have hi : d - 86 < 32 := by omega
          have heq : 86 + (d - 86) = d := by omega
          simpa only [heq] using step0343 ⟨d - 86, hi⟩
    ·
      by_cases h182 : d < 182
      ·
        by_cases h150 : d < 150
        ·
          have hi : d - 118 < 32 := by omega
          have heq : 118 + (d - 118) = d := by omega
          simpa only [heq] using step0344 ⟨d - 118, hi⟩
        ·
          have hi : d - 150 < 32 := by omega
          have heq : 150 + (d - 150) = d := by omega
          simpa only [heq] using step0345 ⟨d - 150, hi⟩
      ·
        by_cases h214 : d < 214
        ·
          have hi : d - 182 < 32 := by omega
          have heq : 182 + (d - 182) = d := by omega
          simpa only [heq] using step0346 ⟨d - 182, hi⟩
        ·
          have hi : d - 214 < 32 := by omega
          have heq : 214 + (d - 214) = d := by omega
          simpa only [heq] using step0347 ⟨d - 214, hi⟩
  ·
    by_cases h374 : d < 374
    ·
      by_cases h310 : d < 310
      ·
        by_cases h278 : d < 278
        ·
          have hi : d - 246 < 32 := by omega
          have heq : 246 + (d - 246) = d := by omega
          simpa only [heq] using step0348 ⟨d - 246, hi⟩
        ·
          have hi : d - 278 < 32 := by omega
          have heq : 278 + (d - 278) = d := by omega
          simpa only [heq] using step0349 ⟨d - 278, hi⟩
      ·
        by_cases h342 : d < 342
        ·
          have hi : d - 310 < 32 := by omega
          have heq : 310 + (d - 310) = d := by omega
          simpa only [heq] using step0350 ⟨d - 310, hi⟩
        ·
          have hi : d - 342 < 32 := by omega
          have heq : 342 + (d - 342) = d := by omega
          simpa only [heq] using step0351 ⟨d - 342, hi⟩
    ·
      by_cases h438 : d < 438
      ·
        by_cases h406 : d < 406
        ·
          have hi : d - 374 < 32 := by omega
          have heq : 374 + (d - 374) = d := by omega
          simpa only [heq] using step0352 ⟨d - 374, hi⟩
        ·
          have hi : d - 406 < 32 := by omega
          have heq : 406 + (d - 406) = d := by omega
          simpa only [heq] using step0353 ⟨d - 406, hi⟩
      ·
        by_cases h470 : d < 470
        ·
          have hi : d - 438 < 32 := by omega
          have heq : 438 + (d - 438) = d := by omega
          simpa only [heq] using step0354 ⟨d - 438, hi⟩
        ·
          have hi : d - 470 < 9 := by omega
          have heq : 470 + (d - 470) = d := by omega
          simpa only [heq] using step0355 ⟨d - 470, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0341,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0341,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0342,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0342,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0343,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0343,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0344,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0344,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0345,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0345,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0346,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0346,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0347,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0347,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0348,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0348,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0349,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0349,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0350,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0350,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0351,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0351,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0352,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0352,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0353,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0353,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0354,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0354,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.fields0355,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.step0355,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow023
