import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022
import Grothe.UpperChaos.OriginalRow227TriangleForward0326
import Grothe.UpperChaos.OriginalRow227TriangleForward0327
import Grothe.UpperChaos.OriginalRow227TriangleForward0328
import Grothe.UpperChaos.OriginalRow227TriangleForward0329
import Grothe.UpperChaos.OriginalRow227TriangleForward0330
import Grothe.UpperChaos.OriginalRow227TriangleForward0331
import Grothe.UpperChaos.OriginalRow227TriangleForward0332
import Grothe.UpperChaos.OriginalRow227TriangleForward0333
import Grothe.UpperChaos.OriginalRow227TriangleForward0334
import Grothe.UpperChaos.OriginalRow227TriangleForward0335
import Grothe.UpperChaos.OriginalRow227TriangleForward0336
import Grothe.UpperChaos.OriginalRow227TriangleForward0337
import Grothe.UpperChaos.OriginalRow227TriangleForward0338
import Grothe.UpperChaos.OriginalRow227TriangleForward0339
import Grothe.UpperChaos.OriginalRow227TriangleForward0340

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0326 : OriginalRow227TriangleForward0326.entries.size = 32 := rfl

def entry0326 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0326.entries[i.val]'(by rw [size0326]; exact i.isLt)

theorem fields0326 (i : Fin 32) :
    (entry0326 i).IA = shift ∧ (entry0326 i).ID = S (21 + i.val + 1) ∧
      (entry0326 i).IC = S 22 ∧ (entry0326 i).Inext = T 21 (21 + i.val + 1) ∧
      (entry0326 i).Icur = T 21 (21 + i.val) ∧
      (entry0326 i).output = T 22 (21 + i.val) ∧
      (entry0326 i).charge = charge 21 (21 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0342_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0326 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (21 + i.val)) shift
      (S (21 + i.val + 1)) (S 22) (T 21 (21 + i.val + 1))
      (T 21 (21 + i.val)) (T 22 (21 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0326.entries OriginalRow227TriangleForward0326.checked
    ⟨i.val, by rw [size0326]; exact i.isLt⟩
  change (entry0326 i).check = true at h
  rcases fields0326 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0327 : OriginalRow227TriangleForward0327.entries.size = 32 := rfl

def entry0327 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0327.entries[i.val]'(by rw [size0327]; exact i.isLt)

theorem fields0327 (i : Fin 32) :
    (entry0327 i).IA = shift ∧ (entry0327 i).ID = S (53 + i.val + 1) ∧
      (entry0327 i).IC = S 22 ∧ (entry0327 i).Inext = T 21 (53 + i.val + 1) ∧
      (entry0327 i).Icur = T 21 (53 + i.val) ∧
      (entry0327 i).output = T 22 (53 + i.val) ∧
      (entry0327 i).charge = charge 21 (53 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0343_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0327 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (53 + i.val)) shift
      (S (53 + i.val + 1)) (S 22) (T 21 (53 + i.val + 1))
      (T 21 (53 + i.val)) (T 22 (53 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0327.entries OriginalRow227TriangleForward0327.checked
    ⟨i.val, by rw [size0327]; exact i.isLt⟩
  change (entry0327 i).check = true at h
  rcases fields0327 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0328 : OriginalRow227TriangleForward0328.entries.size = 32 := rfl

def entry0328 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0328.entries[i.val]'(by rw [size0328]; exact i.isLt)

theorem fields0328 (i : Fin 32) :
    (entry0328 i).IA = shift ∧ (entry0328 i).ID = S (85 + i.val + 1) ∧
      (entry0328 i).IC = S 22 ∧ (entry0328 i).Inext = T 21 (85 + i.val + 1) ∧
      (entry0328 i).Icur = T 21 (85 + i.val) ∧
      (entry0328 i).output = T 22 (85 + i.val) ∧
      (entry0328 i).charge = charge 21 (85 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0344_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0328 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (85 + i.val)) shift
      (S (85 + i.val + 1)) (S 22) (T 21 (85 + i.val + 1))
      (T 21 (85 + i.val)) (T 22 (85 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0328.entries OriginalRow227TriangleForward0328.checked
    ⟨i.val, by rw [size0328]; exact i.isLt⟩
  change (entry0328 i).check = true at h
  rcases fields0328 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0329 : OriginalRow227TriangleForward0329.entries.size = 32 := rfl

def entry0329 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0329.entries[i.val]'(by rw [size0329]; exact i.isLt)

theorem fields0329 (i : Fin 32) :
    (entry0329 i).IA = shift ∧ (entry0329 i).ID = S (117 + i.val + 1) ∧
      (entry0329 i).IC = S 22 ∧ (entry0329 i).Inext = T 21 (117 + i.val + 1) ∧
      (entry0329 i).Icur = T 21 (117 + i.val) ∧
      (entry0329 i).output = T 22 (117 + i.val) ∧
      (entry0329 i).charge = charge 21 (117 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0345_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0329 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (117 + i.val)) shift
      (S (117 + i.val + 1)) (S 22) (T 21 (117 + i.val + 1))
      (T 21 (117 + i.val)) (T 22 (117 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0329.entries OriginalRow227TriangleForward0329.checked
    ⟨i.val, by rw [size0329]; exact i.isLt⟩
  change (entry0329 i).check = true at h
  rcases fields0329 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0330 : OriginalRow227TriangleForward0330.entries.size = 32 := rfl

def entry0330 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0330.entries[i.val]'(by rw [size0330]; exact i.isLt)

theorem fields0330 (i : Fin 32) :
    (entry0330 i).IA = shift ∧ (entry0330 i).ID = S (149 + i.val + 1) ∧
      (entry0330 i).IC = S 22 ∧ (entry0330 i).Inext = T 21 (149 + i.val + 1) ∧
      (entry0330 i).Icur = T 21 (149 + i.val) ∧
      (entry0330 i).output = T 22 (149 + i.val) ∧
      (entry0330 i).charge = charge 21 (149 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0346_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0330 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (149 + i.val)) shift
      (S (149 + i.val + 1)) (S 22) (T 21 (149 + i.val + 1))
      (T 21 (149 + i.val)) (T 22 (149 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0330.entries OriginalRow227TriangleForward0330.checked
    ⟨i.val, by rw [size0330]; exact i.isLt⟩
  change (entry0330 i).check = true at h
  rcases fields0330 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0331 : OriginalRow227TriangleForward0331.entries.size = 32 := rfl

def entry0331 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0331.entries[i.val]'(by rw [size0331]; exact i.isLt)

theorem fields0331 (i : Fin 32) :
    (entry0331 i).IA = shift ∧ (entry0331 i).ID = S (181 + i.val + 1) ∧
      (entry0331 i).IC = S 22 ∧ (entry0331 i).Inext = T 21 (181 + i.val + 1) ∧
      (entry0331 i).Icur = T 21 (181 + i.val) ∧
      (entry0331 i).output = T 22 (181 + i.val) ∧
      (entry0331 i).charge = charge 21 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0347_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0331 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 22) (T 21 (181 + i.val + 1))
      (T 21 (181 + i.val)) (T 22 (181 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0331.entries OriginalRow227TriangleForward0331.checked
    ⟨i.val, by rw [size0331]; exact i.isLt⟩
  change (entry0331 i).check = true at h
  rcases fields0331 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0332 : OriginalRow227TriangleForward0332.entries.size = 32 := rfl

def entry0332 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0332.entries[i.val]'(by rw [size0332]; exact i.isLt)

theorem fields0332 (i : Fin 32) :
    (entry0332 i).IA = shift ∧ (entry0332 i).ID = S (213 + i.val + 1) ∧
      (entry0332 i).IC = S 22 ∧ (entry0332 i).Inext = T 21 (213 + i.val + 1) ∧
      (entry0332 i).Icur = T 21 (213 + i.val) ∧
      (entry0332 i).output = T 22 (213 + i.val) ∧
      (entry0332 i).charge = charge 21 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0348_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0332 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 22) (T 21 (213 + i.val + 1))
      (T 21 (213 + i.val)) (T 22 (213 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0332.entries OriginalRow227TriangleForward0332.checked
    ⟨i.val, by rw [size0332]; exact i.isLt⟩
  change (entry0332 i).check = true at h
  rcases fields0332 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0333 : OriginalRow227TriangleForward0333.entries.size = 32 := rfl

def entry0333 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0333.entries[i.val]'(by rw [size0333]; exact i.isLt)

theorem fields0333 (i : Fin 32) :
    (entry0333 i).IA = shift ∧ (entry0333 i).ID = S (245 + i.val + 1) ∧
      (entry0333 i).IC = S 22 ∧ (entry0333 i).Inext = T 21 (245 + i.val + 1) ∧
      (entry0333 i).Icur = T 21 (245 + i.val) ∧
      (entry0333 i).output = T 22 (245 + i.val) ∧
      (entry0333 i).charge = charge 21 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0349_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0333 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 22) (T 21 (245 + i.val + 1))
      (T 21 (245 + i.val)) (T 22 (245 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0333.entries OriginalRow227TriangleForward0333.checked
    ⟨i.val, by rw [size0333]; exact i.isLt⟩
  change (entry0333 i).check = true at h
  rcases fields0333 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0334 : OriginalRow227TriangleForward0334.entries.size = 32 := rfl

def entry0334 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0334.entries[i.val]'(by rw [size0334]; exact i.isLt)

theorem fields0334 (i : Fin 32) :
    (entry0334 i).IA = shift ∧ (entry0334 i).ID = S (277 + i.val + 1) ∧
      (entry0334 i).IC = S 22 ∧ (entry0334 i).Inext = T 21 (277 + i.val + 1) ∧
      (entry0334 i).Icur = T 21 (277 + i.val) ∧
      (entry0334 i).output = T 22 (277 + i.val) ∧
      (entry0334 i).charge = charge 21 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0350_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0334 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 22) (T 21 (277 + i.val + 1))
      (T 21 (277 + i.val)) (T 22 (277 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0334.entries OriginalRow227TriangleForward0334.checked
    ⟨i.val, by rw [size0334]; exact i.isLt⟩
  change (entry0334 i).check = true at h
  rcases fields0334 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0335 : OriginalRow227TriangleForward0335.entries.size = 32 := rfl

def entry0335 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0335.entries[i.val]'(by rw [size0335]; exact i.isLt)

theorem fields0335 (i : Fin 32) :
    (entry0335 i).IA = shift ∧ (entry0335 i).ID = S (309 + i.val + 1) ∧
      (entry0335 i).IC = S 22 ∧ (entry0335 i).Inext = T 21 (309 + i.val + 1) ∧
      (entry0335 i).Icur = T 21 (309 + i.val) ∧
      (entry0335 i).output = T 22 (309 + i.val) ∧
      (entry0335 i).charge = charge 21 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0351_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0335 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 22) (T 21 (309 + i.val + 1))
      (T 21 (309 + i.val)) (T 22 (309 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0335.entries OriginalRow227TriangleForward0335.checked
    ⟨i.val, by rw [size0335]; exact i.isLt⟩
  change (entry0335 i).check = true at h
  rcases fields0335 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0336 : OriginalRow227TriangleForward0336.entries.size = 32 := rfl

def entry0336 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0336.entries[i.val]'(by rw [size0336]; exact i.isLt)

theorem fields0336 (i : Fin 32) :
    (entry0336 i).IA = shift ∧ (entry0336 i).ID = S (341 + i.val + 1) ∧
      (entry0336 i).IC = S 22 ∧ (entry0336 i).Inext = T 21 (341 + i.val + 1) ∧
      (entry0336 i).Icur = T 21 (341 + i.val) ∧
      (entry0336 i).output = T 22 (341 + i.val) ∧
      (entry0336 i).charge = charge 21 (341 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0352_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0336 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (341 + i.val)) shift
      (S (341 + i.val + 1)) (S 22) (T 21 (341 + i.val + 1))
      (T 21 (341 + i.val)) (T 22 (341 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0336.entries OriginalRow227TriangleForward0336.checked
    ⟨i.val, by rw [size0336]; exact i.isLt⟩
  change (entry0336 i).check = true at h
  rcases fields0336 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0337 : OriginalRow227TriangleForward0337.entries.size = 32 := rfl

def entry0337 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0337.entries[i.val]'(by rw [size0337]; exact i.isLt)

theorem fields0337 (i : Fin 32) :
    (entry0337 i).IA = shift ∧ (entry0337 i).ID = S (373 + i.val + 1) ∧
      (entry0337 i).IC = S 22 ∧ (entry0337 i).Inext = T 21 (373 + i.val + 1) ∧
      (entry0337 i).Icur = T 21 (373 + i.val) ∧
      (entry0337 i).output = T 22 (373 + i.val) ∧
      (entry0337 i).charge = charge 21 (373 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0353_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0337 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (373 + i.val)) shift
      (S (373 + i.val + 1)) (S 22) (T 21 (373 + i.val + 1))
      (T 21 (373 + i.val)) (T 22 (373 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0337.entries OriginalRow227TriangleForward0337.checked
    ⟨i.val, by rw [size0337]; exact i.isLt⟩
  change (entry0337 i).check = true at h
  rcases fields0337 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0338 : OriginalRow227TriangleForward0338.entries.size = 32 := rfl

def entry0338 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0338.entries[i.val]'(by rw [size0338]; exact i.isLt)

theorem fields0338 (i : Fin 32) :
    (entry0338 i).IA = shift ∧ (entry0338 i).ID = S (405 + i.val + 1) ∧
      (entry0338 i).IC = S 22 ∧ (entry0338 i).Inext = T 21 (405 + i.val + 1) ∧
      (entry0338 i).Icur = T 21 (405 + i.val) ∧
      (entry0338 i).output = T 22 (405 + i.val) ∧
      (entry0338 i).charge = charge 21 (405 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0354_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0338 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (405 + i.val)) shift
      (S (405 + i.val + 1)) (S 22) (T 21 (405 + i.val + 1))
      (T 21 (405 + i.val)) (T 22 (405 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0338.entries OriginalRow227TriangleForward0338.checked
    ⟨i.val, by rw [size0338]; exact i.isLt⟩
  change (entry0338 i).check = true at h
  rcases fields0338 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0339 : OriginalRow227TriangleForward0339.entries.size = 32 := rfl

def entry0339 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0339.entries[i.val]'(by rw [size0339]; exact i.isLt)

theorem fields0339 (i : Fin 32) :
    (entry0339 i).IA = shift ∧ (entry0339 i).ID = S (437 + i.val + 1) ∧
      (entry0339 i).IC = S 22 ∧ (entry0339 i).Inext = T 21 (437 + i.val + 1) ∧
      (entry0339 i).Icur = T 21 (437 + i.val) ∧
      (entry0339 i).output = T 22 (437 + i.val) ∧
      (entry0339 i).charge = charge 21 (437 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0355_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0339 (i : Fin 32) :
    forwardStepOK (-768) (charge 21 (437 + i.val)) shift
      (S (437 + i.val + 1)) (S 22) (T 21 (437 + i.val + 1))
      (T 21 (437 + i.val)) (T 22 (437 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0339.entries OriginalRow227TriangleForward0339.checked
    ⟨i.val, by rw [size0339]; exact i.isLt⟩
  change (entry0339 i).check = true at h
  rcases fields0339 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0340 : OriginalRow227TriangleForward0340.entries.size = 11 := rfl

def entry0340 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0340.entries[i.val]'(by rw [size0340]; exact i.isLt)

theorem fields0340 (i : Fin 11) :
    (entry0340 i).IA = shift ∧ (entry0340 i).ID = S (469 + i.val + 1) ∧
      (entry0340 i).IC = S 22 ∧ (entry0340 i).Inext = T 21 (469 + i.val + 1) ∧
      (entry0340 i).Icur = T 21 (469 + i.val) ∧
      (entry0340 i).output = T 22 (469 + i.val) ∧
      (entry0340 i).charge = charge 21 (469 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow022.block0356_value ⟨10, by decide⟩).symm, rfl⟩

theorem step0340 (i : Fin 11) :
    forwardStepOK (-768) (charge 21 (469 + i.val)) shift
      (S (469 + i.val + 1)) (S 22) (T 21 (469 + i.val + 1))
      (T 21 (469 + i.val)) (T 22 (469 + i.val))
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0340.entries OriginalRow227TriangleForward0340.checked
    ⟨i.val, by rw [size0340]; exact i.isLt⟩
  change (entry0340 i).check = true at h
  rcases fields0340 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 21 ≤ d) (hhi : d < 480) :
    forwardStepOK (-768) (charge 21 d) shift (S (d + 1)) (S 22)
      (T 21 (d + 1)) (T 21 d) (T 22 d)
      (OriginalRow227Roots.root_pos 22 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 21 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h117 : d < 117
    ·
      by_cases h53 : d < 53
      ·
        have hi : d - 21 < 32 := by omega
        have heq : 21 + (d - 21) = d := by omega
        simpa only [heq] using step0326 ⟨d - 21, hi⟩
      ·
        by_cases h85 : d < 85
        ·
          have hi : d - 53 < 32 := by omega
          have heq : 53 + (d - 53) = d := by omega
          simpa only [heq] using step0327 ⟨d - 53, hi⟩
        ·
          have hi : d - 85 < 32 := by omega
          have heq : 85 + (d - 85) = d := by omega
          simpa only [heq] using step0328 ⟨d - 85, hi⟩
    ·
      by_cases h181 : d < 181
      ·
        by_cases h149 : d < 149
        ·
          have hi : d - 117 < 32 := by omega
          have heq : 117 + (d - 117) = d := by omega
          simpa only [heq] using step0329 ⟨d - 117, hi⟩
        ·
          have hi : d - 149 < 32 := by omega
          have heq : 149 + (d - 149) = d := by omega
          simpa only [heq] using step0330 ⟨d - 149, hi⟩
      ·
        by_cases h213 : d < 213
        ·
          have hi : d - 181 < 32 := by omega
          have heq : 181 + (d - 181) = d := by omega
          simpa only [heq] using step0331 ⟨d - 181, hi⟩
        ·
          have hi : d - 213 < 32 := by omega
          have heq : 213 + (d - 213) = d := by omega
          simpa only [heq] using step0332 ⟨d - 213, hi⟩
  ·
    by_cases h373 : d < 373
    ·
      by_cases h309 : d < 309
      ·
        by_cases h277 : d < 277
        ·
          have hi : d - 245 < 32 := by omega
          have heq : 245 + (d - 245) = d := by omega
          simpa only [heq] using step0333 ⟨d - 245, hi⟩
        ·
          have hi : d - 277 < 32 := by omega
          have heq : 277 + (d - 277) = d := by omega
          simpa only [heq] using step0334 ⟨d - 277, hi⟩
      ·
        by_cases h341 : d < 341
        ·
          have hi : d - 309 < 32 := by omega
          have heq : 309 + (d - 309) = d := by omega
          simpa only [heq] using step0335 ⟨d - 309, hi⟩
        ·
          have hi : d - 341 < 32 := by omega
          have heq : 341 + (d - 341) = d := by omega
          simpa only [heq] using step0336 ⟨d - 341, hi⟩
    ·
      by_cases h437 : d < 437
      ·
        by_cases h405 : d < 405
        ·
          have hi : d - 373 < 32 := by omega
          have heq : 373 + (d - 373) = d := by omega
          simpa only [heq] using step0337 ⟨d - 373, hi⟩
        ·
          have hi : d - 405 < 32 := by omega
          have heq : 405 + (d - 405) = d := by omega
          simpa only [heq] using step0338 ⟨d - 405, hi⟩
      ·
        by_cases h469 : d < 469
        ·
          have hi : d - 437 < 32 := by omega
          have heq : 437 + (d - 437) = d := by omega
          simpa only [heq] using step0339 ⟨d - 437, hi⟩
        ·
          have hi : d - 469 < 11 := by omega
          have heq : 469 + (d - 469) = d := by omega
          simpa only [heq] using step0340 ⟨d - 469, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0326,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0326,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0327,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0327,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0328,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0328,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0329,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0329,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0330,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0330,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0331,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0331,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0332,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0332,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0333,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0333,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0334,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0334,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0335,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0335,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0336,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0336,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0337,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0337,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0338,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0338,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0339,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0339,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.fields0340,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.step0340,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow022
