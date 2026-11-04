import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003
import Grothe.UpperChaos.OriginalRow227TriangleForward0032
import Grothe.UpperChaos.OriginalRow227TriangleForward0033
import Grothe.UpperChaos.OriginalRow227TriangleForward0034
import Grothe.UpperChaos.OriginalRow227TriangleForward0035
import Grothe.UpperChaos.OriginalRow227TriangleForward0036
import Grothe.UpperChaos.OriginalRow227TriangleForward0037
import Grothe.UpperChaos.OriginalRow227TriangleForward0038
import Grothe.UpperChaos.OriginalRow227TriangleForward0039
import Grothe.UpperChaos.OriginalRow227TriangleForward0040
import Grothe.UpperChaos.OriginalRow227TriangleForward0041
import Grothe.UpperChaos.OriginalRow227TriangleForward0042
import Grothe.UpperChaos.OriginalRow227TriangleForward0043
import Grothe.UpperChaos.OriginalRow227TriangleForward0044
import Grothe.UpperChaos.OriginalRow227TriangleForward0045
import Grothe.UpperChaos.OriginalRow227TriangleForward0046
import Grothe.UpperChaos.OriginalRow227TriangleForward0047

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0032 : OriginalRow227TriangleForward0032.entries.size = 32 := rfl

def entry0032 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0032.entries[i.val]'(by rw [size0032]; exact i.isLt)

theorem fields0032 (i : Fin 32) :
    (entry0032 i).IA = shift ∧ (entry0032 i).ID = S (2 + i.val + 1) ∧
      (entry0032 i).IC = S 3 ∧ (entry0032 i).Inext = T 2 (2 + i.val + 1) ∧
      (entry0032 i).Icur = T 2 (2 + i.val) ∧
      (entry0032 i).output = T 3 (2 + i.val) ∧
      (entry0032 i).charge = charge 2 (2 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root3).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root4).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root5).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0032 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (2 + i.val)) shift
      (S (2 + i.val + 1)) (S 3) (T 2 (2 + i.val + 1))
      (T 2 (2 + i.val)) (T 3 (2 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0032.entries OriginalRow227TriangleForward0032.checked
    ⟨i.val, by rw [size0032]; exact i.isLt⟩
  change (entry0032 i).check = true at h
  rcases fields0032 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0033 : OriginalRow227TriangleForward0033.entries.size = 32 := rfl

def entry0033 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0033.entries[i.val]'(by rw [size0033]; exact i.isLt)

theorem fields0033 (i : Fin 32) :
    (entry0033 i).IA = shift ∧ (entry0033 i).ID = S (34 + i.val + 1) ∧
      (entry0033 i).IC = S 3 ∧ (entry0033 i).Inext = T 2 (34 + i.val + 1) ∧
      (entry0033 i).Icur = T 2 (34 + i.val) ∧
      (entry0033 i).output = T 3 (34 + i.val) ∧
      (entry0033 i).charge = charge 2 (34 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0033 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (34 + i.val)) shift
      (S (34 + i.val + 1)) (S 3) (T 2 (34 + i.val + 1))
      (T 2 (34 + i.val)) (T 3 (34 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0033.entries OriginalRow227TriangleForward0033.checked
    ⟨i.val, by rw [size0033]; exact i.isLt⟩
  change (entry0033 i).check = true at h
  rcases fields0033 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0034 : OriginalRow227TriangleForward0034.entries.size = 32 := rfl

def entry0034 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0034.entries[i.val]'(by rw [size0034]; exact i.isLt)

theorem fields0034 (i : Fin 32) :
    (entry0034 i).IA = shift ∧ (entry0034 i).ID = S (66 + i.val + 1) ∧
      (entry0034 i).IC = S 3 ∧ (entry0034 i).Inext = T 2 (66 + i.val + 1) ∧
      (entry0034 i).Icur = T 2 (66 + i.val) ∧
      (entry0034 i).output = T 3 (66 + i.val) ∧
      (entry0034 i).charge = charge 2 (66 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0034 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (66 + i.val)) shift
      (S (66 + i.val + 1)) (S 3) (T 2 (66 + i.val + 1))
      (T 2 (66 + i.val)) (T 3 (66 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0034.entries OriginalRow227TriangleForward0034.checked
    ⟨i.val, by rw [size0034]; exact i.isLt⟩
  change (entry0034 i).check = true at h
  rcases fields0034 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0035 : OriginalRow227TriangleForward0035.entries.size = 32 := rfl

def entry0035 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0035.entries[i.val]'(by rw [size0035]; exact i.isLt)

theorem fields0035 (i : Fin 32) :
    (entry0035 i).IA = shift ∧ (entry0035 i).ID = S (98 + i.val + 1) ∧
      (entry0035 i).IC = S 3 ∧ (entry0035 i).Inext = T 2 (98 + i.val + 1) ∧
      (entry0035 i).Icur = T 2 (98 + i.val) ∧
      (entry0035 i).output = T 3 (98 + i.val) ∧
      (entry0035 i).charge = charge 2 (98 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0035 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (98 + i.val)) shift
      (S (98 + i.val + 1)) (S 3) (T 2 (98 + i.val + 1))
      (T 2 (98 + i.val)) (T 3 (98 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0035.entries OriginalRow227TriangleForward0035.checked
    ⟨i.val, by rw [size0035]; exact i.isLt⟩
  change (entry0035 i).check = true at h
  rcases fields0035 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0036 : OriginalRow227TriangleForward0036.entries.size = 32 := rfl

def entry0036 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0036.entries[i.val]'(by rw [size0036]; exact i.isLt)

theorem fields0036 (i : Fin 32) :
    (entry0036 i).IA = shift ∧ (entry0036 i).ID = S (130 + i.val + 1) ∧
      (entry0036 i).IC = S 3 ∧ (entry0036 i).Inext = T 2 (130 + i.val + 1) ∧
      (entry0036 i).Icur = T 2 (130 + i.val) ∧
      (entry0036 i).output = T 3 (130 + i.val) ∧
      (entry0036 i).charge = charge 2 (130 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0036 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (130 + i.val)) shift
      (S (130 + i.val + 1)) (S 3) (T 2 (130 + i.val + 1))
      (T 2 (130 + i.val)) (T 3 (130 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0036.entries OriginalRow227TriangleForward0036.checked
    ⟨i.val, by rw [size0036]; exact i.isLt⟩
  change (entry0036 i).check = true at h
  rcases fields0036 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0037 : OriginalRow227TriangleForward0037.entries.size = 32 := rfl

def entry0037 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0037.entries[i.val]'(by rw [size0037]; exact i.isLt)

theorem fields0037 (i : Fin 32) :
    (entry0037 i).IA = shift ∧ (entry0037 i).ID = S (162 + i.val + 1) ∧
      (entry0037 i).IC = S 3 ∧ (entry0037 i).Inext = T 2 (162 + i.val + 1) ∧
      (entry0037 i).Icur = T 2 (162 + i.val) ∧
      (entry0037 i).output = T 3 (162 + i.val) ∧
      (entry0037 i).charge = charge 2 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0037 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 3) (T 2 (162 + i.val + 1))
      (T 2 (162 + i.val)) (T 3 (162 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0037.entries OriginalRow227TriangleForward0037.checked
    ⟨i.val, by rw [size0037]; exact i.isLt⟩
  change (entry0037 i).check = true at h
  rcases fields0037 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0038 : OriginalRow227TriangleForward0038.entries.size = 32 := rfl

def entry0038 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0038.entries[i.val]'(by rw [size0038]; exact i.isLt)

theorem fields0038 (i : Fin 32) :
    (entry0038 i).IA = shift ∧ (entry0038 i).ID = S (194 + i.val + 1) ∧
      (entry0038 i).IC = S 3 ∧ (entry0038 i).Inext = T 2 (194 + i.val + 1) ∧
      (entry0038 i).Icur = T 2 (194 + i.val) ∧
      (entry0038 i).output = T 3 (194 + i.val) ∧
      (entry0038 i).charge = charge 2 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0038 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 3) (T 2 (194 + i.val + 1))
      (T 2 (194 + i.val)) (T 3 (194 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0038.entries OriginalRow227TriangleForward0038.checked
    ⟨i.val, by rw [size0038]; exact i.isLt⟩
  change (entry0038 i).check = true at h
  rcases fields0038 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0039 : OriginalRow227TriangleForward0039.entries.size = 32 := rfl

def entry0039 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0039.entries[i.val]'(by rw [size0039]; exact i.isLt)

theorem fields0039 (i : Fin 32) :
    (entry0039 i).IA = shift ∧ (entry0039 i).ID = S (226 + i.val + 1) ∧
      (entry0039 i).IC = S 3 ∧ (entry0039 i).Inext = T 2 (226 + i.val + 1) ∧
      (entry0039 i).Icur = T 2 (226 + i.val) ∧
      (entry0039 i).output = T 3 (226 + i.val) ∧
      (entry0039 i).charge = charge 2 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0039 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 3) (T 2 (226 + i.val + 1))
      (T 2 (226 + i.val)) (T 3 (226 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0039.entries OriginalRow227TriangleForward0039.checked
    ⟨i.val, by rw [size0039]; exact i.isLt⟩
  change (entry0039 i).check = true at h
  rcases fields0039 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0040 : OriginalRow227TriangleForward0040.entries.size = 32 := rfl

def entry0040 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0040.entries[i.val]'(by rw [size0040]; exact i.isLt)

theorem fields0040 (i : Fin 32) :
    (entry0040 i).IA = shift ∧ (entry0040 i).ID = S (258 + i.val + 1) ∧
      (entry0040 i).IC = S 3 ∧ (entry0040 i).Inext = T 2 (258 + i.val + 1) ∧
      (entry0040 i).Icur = T 2 (258 + i.val) ∧
      (entry0040 i).output = T 3 (258 + i.val) ∧
      (entry0040 i).charge = charge 2 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0040 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 3) (T 2 (258 + i.val + 1))
      (T 2 (258 + i.val)) (T 3 (258 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0040.entries OriginalRow227TriangleForward0040.checked
    ⟨i.val, by rw [size0040]; exact i.isLt⟩
  change (entry0040 i).check = true at h
  rcases fields0040 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0041 : OriginalRow227TriangleForward0041.entries.size = 32 := rfl

def entry0041 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0041.entries[i.val]'(by rw [size0041]; exact i.isLt)

theorem fields0041 (i : Fin 32) :
    (entry0041 i).IA = shift ∧ (entry0041 i).ID = S (290 + i.val + 1) ∧
      (entry0041 i).IC = S 3 ∧ (entry0041 i).Inext = T 2 (290 + i.val + 1) ∧
      (entry0041 i).Icur = T 2 (290 + i.val) ∧
      (entry0041 i).output = T 3 (290 + i.val) ∧
      (entry0041 i).charge = charge 2 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0041 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 3) (T 2 (290 + i.val + 1))
      (T 2 (290 + i.val)) (T 3 (290 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0041.entries OriginalRow227TriangleForward0041.checked
    ⟨i.val, by rw [size0041]; exact i.isLt⟩
  change (entry0041 i).check = true at h
  rcases fields0041 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0042 : OriginalRow227TriangleForward0042.entries.size = 32 := rfl

def entry0042 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0042.entries[i.val]'(by rw [size0042]; exact i.isLt)

theorem fields0042 (i : Fin 32) :
    (entry0042 i).IA = shift ∧ (entry0042 i).ID = S (322 + i.val + 1) ∧
      (entry0042 i).IC = S 3 ∧ (entry0042 i).Inext = T 2 (322 + i.val + 1) ∧
      (entry0042 i).Icur = T 2 (322 + i.val) ∧
      (entry0042 i).output = T 3 (322 + i.val) ∧
      (entry0042 i).charge = charge 2 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0042 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 3) (T 2 (322 + i.val + 1))
      (T 2 (322 + i.val)) (T 3 (322 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0042.entries OriginalRow227TriangleForward0042.checked
    ⟨i.val, by rw [size0042]; exact i.isLt⟩
  change (entry0042 i).check = true at h
  rcases fields0042 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0043 : OriginalRow227TriangleForward0043.entries.size = 32 := rfl

def entry0043 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0043.entries[i.val]'(by rw [size0043]; exact i.isLt)

theorem fields0043 (i : Fin 32) :
    (entry0043 i).IA = shift ∧ (entry0043 i).ID = S (354 + i.val + 1) ∧
      (entry0043 i).IC = S 3 ∧ (entry0043 i).Inext = T 2 (354 + i.val + 1) ∧
      (entry0043 i).Icur = T 2 (354 + i.val) ∧
      (entry0043 i).output = T 3 (354 + i.val) ∧
      (entry0043 i).charge = charge 2 (354 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0043 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (354 + i.val)) shift
      (S (354 + i.val + 1)) (S 3) (T 2 (354 + i.val + 1))
      (T 2 (354 + i.val)) (T 3 (354 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0043.entries OriginalRow227TriangleForward0043.checked
    ⟨i.val, by rw [size0043]; exact i.isLt⟩
  change (entry0043 i).check = true at h
  rcases fields0043 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0044 : OriginalRow227TriangleForward0044.entries.size = 32 := rfl

def entry0044 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0044.entries[i.val]'(by rw [size0044]; exact i.isLt)

theorem fields0044 (i : Fin 32) :
    (entry0044 i).IA = shift ∧ (entry0044 i).ID = S (386 + i.val + 1) ∧
      (entry0044 i).IC = S 3 ∧ (entry0044 i).Inext = T 2 (386 + i.val + 1) ∧
      (entry0044 i).Icur = T 2 (386 + i.val) ∧
      (entry0044 i).output = T 3 (386 + i.val) ∧
      (entry0044 i).charge = charge 2 (386 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0044 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (386 + i.val)) shift
      (S (386 + i.val + 1)) (S 3) (T 2 (386 + i.val + 1))
      (T 2 (386 + i.val)) (T 3 (386 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0044.entries OriginalRow227TriangleForward0044.checked
    ⟨i.val, by rw [size0044]; exact i.isLt⟩
  change (entry0044 i).check = true at h
  rcases fields0044 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0045 : OriginalRow227TriangleForward0045.entries.size = 32 := rfl

def entry0045 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0045.entries[i.val]'(by rw [size0045]; exact i.isLt)

theorem fields0045 (i : Fin 32) :
    (entry0045 i).IA = shift ∧ (entry0045 i).ID = S (418 + i.val + 1) ∧
      (entry0045 i).IC = S 3 ∧ (entry0045 i).Inext = T 2 (418 + i.val + 1) ∧
      (entry0045 i).Icur = T 2 (418 + i.val) ∧
      (entry0045 i).output = T 3 (418 + i.val) ∧
      (entry0045 i).charge = charge 2 (418 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0045 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (418 + i.val)) shift
      (S (418 + i.val + 1)) (S 3) (T 2 (418 + i.val + 1))
      (T 2 (418 + i.val)) (T 3 (418 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0045.entries OriginalRow227TriangleForward0045.checked
    ⟨i.val, by rw [size0045]; exact i.isLt⟩
  change (entry0045 i).check = true at h
  rcases fields0045 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0046 : OriginalRow227TriangleForward0046.entries.size = 32 := rfl

def entry0046 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0046.entries[i.val]'(by rw [size0046]; exact i.isLt)

theorem fields0046 (i : Fin 32) :
    (entry0046 i).IA = shift ∧ (entry0046 i).ID = S (450 + i.val + 1) ∧
      (entry0046 i).IC = S 3 ∧ (entry0046 i).Inext = T 2 (450 + i.val + 1) ∧
      (entry0046 i).Icur = T 2 (450 + i.val) ∧
      (entry0046 i).output = T 3 (450 + i.val) ∧
      (entry0046 i).charge = charge 2 (450 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0046 (i : Fin 32) :
    forwardStepOK (-768) (charge 2 (450 + i.val)) shift
      (S (450 + i.val + 1)) (S 3) (T 2 (450 + i.val + 1))
      (T 2 (450 + i.val)) (T 3 (450 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0046.entries OriginalRow227TriangleForward0046.checked
    ⟨i.val, by rw [size0046]; exact i.isLt⟩
  change (entry0046 i).check = true at h
  rcases fields0046 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0047 : OriginalRow227TriangleForward0047.entries.size = 17 := rfl

def entry0047 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0047.entries[i.val]'(by rw [size0047]; exact i.isLt)

theorem fields0047 (i : Fin 17) :
    (entry0047 i).IA = shift ∧ (entry0047 i).ID = S (482 + i.val + 1) ∧
      (entry0047 i).IC = S 3 ∧ (entry0047 i).Inext = T 2 (482 + i.val + 1) ∧
      (entry0047 i).Icur = T 2 (482 + i.val) ∧
      (entry0047 i).output = T 3 (482 + i.val) ∧
      (entry0047 i).charge = charge 2 (482 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root497).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root498).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root499).symm, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨16, by decide⟩).symm, rfl⟩

theorem step0047 (i : Fin 17) :
    forwardStepOK (-768) (charge 2 (482 + i.val)) shift
      (S (482 + i.val + 1)) (S 3) (T 2 (482 + i.val + 1))
      (T 2 (482 + i.val)) (T 3 (482 + i.val))
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0047.entries OriginalRow227TriangleForward0047.checked
    ⟨i.val, by rw [size0047]; exact i.isLt⟩
  change (entry0047 i).check = true at h
  rcases fields0047 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 2 ≤ d) (hhi : d < 499) :
    forwardStepOK (-768) (charge 2 d) shift (S (d + 1)) (S 3)
      (T 2 (d + 1)) (T 2 d) (T 3 d)
      (OriginalRow227Roots.root_pos 3 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 2 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h130 : d < 130
    ·
      by_cases h66 : d < 66
      ·
        by_cases h34 : d < 34
        ·
          have hi : d - 2 < 32 := by omega
          have heq : 2 + (d - 2) = d := by omega
          simpa only [heq] using step0032 ⟨d - 2, hi⟩
        ·
          have hi : d - 34 < 32 := by omega
          have heq : 34 + (d - 34) = d := by omega
          simpa only [heq] using step0033 ⟨d - 34, hi⟩
      ·
        by_cases h98 : d < 98
        ·
          have hi : d - 66 < 32 := by omega
          have heq : 66 + (d - 66) = d := by omega
          simpa only [heq] using step0034 ⟨d - 66, hi⟩
        ·
          have hi : d - 98 < 32 := by omega
          have heq : 98 + (d - 98) = d := by omega
          simpa only [heq] using step0035 ⟨d - 98, hi⟩
    ·
      by_cases h194 : d < 194
      ·
        by_cases h162 : d < 162
        ·
          have hi : d - 130 < 32 := by omega
          have heq : 130 + (d - 130) = d := by omega
          simpa only [heq] using step0036 ⟨d - 130, hi⟩
        ·
          have hi : d - 162 < 32 := by omega
          have heq : 162 + (d - 162) = d := by omega
          simpa only [heq] using step0037 ⟨d - 162, hi⟩
      ·
        by_cases h226 : d < 226
        ·
          have hi : d - 194 < 32 := by omega
          have heq : 194 + (d - 194) = d := by omega
          simpa only [heq] using step0038 ⟨d - 194, hi⟩
        ·
          have hi : d - 226 < 32 := by omega
          have heq : 226 + (d - 226) = d := by omega
          simpa only [heq] using step0039 ⟨d - 226, hi⟩
  ·
    by_cases h386 : d < 386
    ·
      by_cases h322 : d < 322
      ·
        by_cases h290 : d < 290
        ·
          have hi : d - 258 < 32 := by omega
          have heq : 258 + (d - 258) = d := by omega
          simpa only [heq] using step0040 ⟨d - 258, hi⟩
        ·
          have hi : d - 290 < 32 := by omega
          have heq : 290 + (d - 290) = d := by omega
          simpa only [heq] using step0041 ⟨d - 290, hi⟩
      ·
        by_cases h354 : d < 354
        ·
          have hi : d - 322 < 32 := by omega
          have heq : 322 + (d - 322) = d := by omega
          simpa only [heq] using step0042 ⟨d - 322, hi⟩
        ·
          have hi : d - 354 < 32 := by omega
          have heq : 354 + (d - 354) = d := by omega
          simpa only [heq] using step0043 ⟨d - 354, hi⟩
    ·
      by_cases h450 : d < 450
      ·
        by_cases h418 : d < 418
        ·
          have hi : d - 386 < 32 := by omega
          have heq : 386 + (d - 386) = d := by omega
          simpa only [heq] using step0044 ⟨d - 386, hi⟩
        ·
          have hi : d - 418 < 32 := by omega
          have heq : 418 + (d - 418) = d := by omega
          simpa only [heq] using step0045 ⟨d - 418, hi⟩
      ·
        by_cases h482 : d < 482
        ·
          have hi : d - 450 < 32 := by omega
          have heq : 450 + (d - 450) = d := by omega
          simpa only [heq] using step0046 ⟨d - 450, hi⟩
        ·
          have hi : d - 482 < 17 := by omega
          have heq : 482 + (d - 482) = d := by omega
          simpa only [heq] using step0047 ⟨d - 482, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.fields0047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.step0047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow003
