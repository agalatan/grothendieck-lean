import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004
import Grothe.UpperChaos.OriginalRow227TriangleForward0048
import Grothe.UpperChaos.OriginalRow227TriangleForward0049
import Grothe.UpperChaos.OriginalRow227TriangleForward0050
import Grothe.UpperChaos.OriginalRow227TriangleForward0051
import Grothe.UpperChaos.OriginalRow227TriangleForward0052
import Grothe.UpperChaos.OriginalRow227TriangleForward0053
import Grothe.UpperChaos.OriginalRow227TriangleForward0054
import Grothe.UpperChaos.OriginalRow227TriangleForward0055
import Grothe.UpperChaos.OriginalRow227TriangleForward0056
import Grothe.UpperChaos.OriginalRow227TriangleForward0057
import Grothe.UpperChaos.OriginalRow227TriangleForward0058
import Grothe.UpperChaos.OriginalRow227TriangleForward0059
import Grothe.UpperChaos.OriginalRow227TriangleForward0060
import Grothe.UpperChaos.OriginalRow227TriangleForward0061
import Grothe.UpperChaos.OriginalRow227TriangleForward0062
import Grothe.UpperChaos.OriginalRow227TriangleForward0063

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0048 : OriginalRow227TriangleForward0048.entries.size = 32 := rfl

def entry0048 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0048.entries[i.val]'(by rw [size0048]; exact i.isLt)

theorem fields0048 (i : Fin 32) :
    (entry0048 i).IA = shift ∧ (entry0048 i).ID = S (3 + i.val + 1) ∧
      (entry0048 i).IC = S 4 ∧ (entry0048 i).Inext = T 3 (3 + i.val + 1) ∧
      (entry0048 i).Icur = T 3 (3 + i.val) ∧
      (entry0048 i).output = T 4 (3 + i.val) ∧
      (entry0048 i).charge = charge 3 (3 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root4).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root5).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0048_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0048 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (3 + i.val)) shift
      (S (3 + i.val + 1)) (S 4) (T 3 (3 + i.val + 1))
      (T 3 (3 + i.val)) (T 4 (3 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0048.entries OriginalRow227TriangleForward0048.checked
    ⟨i.val, by rw [size0048]; exact i.isLt⟩
  change (entry0048 i).check = true at h
  rcases fields0048 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0049 : OriginalRow227TriangleForward0049.entries.size = 32 := rfl

def entry0049 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0049.entries[i.val]'(by rw [size0049]; exact i.isLt)

theorem fields0049 (i : Fin 32) :
    (entry0049 i).IA = shift ∧ (entry0049 i).ID = S (35 + i.val + 1) ∧
      (entry0049 i).IC = S 4 ∧ (entry0049 i).Inext = T 3 (35 + i.val + 1) ∧
      (entry0049 i).Icur = T 3 (35 + i.val) ∧
      (entry0049 i).output = T 4 (35 + i.val) ∧
      (entry0049 i).charge = charge 3 (35 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0049 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (35 + i.val)) shift
      (S (35 + i.val + 1)) (S 4) (T 3 (35 + i.val + 1))
      (T 3 (35 + i.val)) (T 4 (35 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0049.entries OriginalRow227TriangleForward0049.checked
    ⟨i.val, by rw [size0049]; exact i.isLt⟩
  change (entry0049 i).check = true at h
  rcases fields0049 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0050 : OriginalRow227TriangleForward0050.entries.size = 32 := rfl

def entry0050 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0050.entries[i.val]'(by rw [size0050]; exact i.isLt)

theorem fields0050 (i : Fin 32) :
    (entry0050 i).IA = shift ∧ (entry0050 i).ID = S (67 + i.val + 1) ∧
      (entry0050 i).IC = S 4 ∧ (entry0050 i).Inext = T 3 (67 + i.val + 1) ∧
      (entry0050 i).Icur = T 3 (67 + i.val) ∧
      (entry0050 i).output = T 4 (67 + i.val) ∧
      (entry0050 i).charge = charge 3 (67 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0050 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (67 + i.val)) shift
      (S (67 + i.val + 1)) (S 4) (T 3 (67 + i.val + 1))
      (T 3 (67 + i.val)) (T 4 (67 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0050.entries OriginalRow227TriangleForward0050.checked
    ⟨i.val, by rw [size0050]; exact i.isLt⟩
  change (entry0050 i).check = true at h
  rcases fields0050 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0051 : OriginalRow227TriangleForward0051.entries.size = 32 := rfl

def entry0051 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0051.entries[i.val]'(by rw [size0051]; exact i.isLt)

theorem fields0051 (i : Fin 32) :
    (entry0051 i).IA = shift ∧ (entry0051 i).ID = S (99 + i.val + 1) ∧
      (entry0051 i).IC = S 4 ∧ (entry0051 i).Inext = T 3 (99 + i.val + 1) ∧
      (entry0051 i).Icur = T 3 (99 + i.val) ∧
      (entry0051 i).output = T 4 (99 + i.val) ∧
      (entry0051 i).charge = charge 3 (99 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0051_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0051 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (99 + i.val)) shift
      (S (99 + i.val + 1)) (S 4) (T 3 (99 + i.val + 1))
      (T 3 (99 + i.val)) (T 4 (99 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0051.entries OriginalRow227TriangleForward0051.checked
    ⟨i.val, by rw [size0051]; exact i.isLt⟩
  change (entry0051 i).check = true at h
  rcases fields0051 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0052 : OriginalRow227TriangleForward0052.entries.size = 32 := rfl

def entry0052 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0052.entries[i.val]'(by rw [size0052]; exact i.isLt)

theorem fields0052 (i : Fin 32) :
    (entry0052 i).IA = shift ∧ (entry0052 i).ID = S (131 + i.val + 1) ∧
      (entry0052 i).IC = S 4 ∧ (entry0052 i).Inext = T 3 (131 + i.val + 1) ∧
      (entry0052 i).Icur = T 3 (131 + i.val) ∧
      (entry0052 i).output = T 4 (131 + i.val) ∧
      (entry0052 i).charge = charge 3 (131 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0052 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (131 + i.val)) shift
      (S (131 + i.val + 1)) (S 4) (T 3 (131 + i.val + 1))
      (T 3 (131 + i.val)) (T 4 (131 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0052.entries OriginalRow227TriangleForward0052.checked
    ⟨i.val, by rw [size0052]; exact i.isLt⟩
  change (entry0052 i).check = true at h
  rcases fields0052 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0053 : OriginalRow227TriangleForward0053.entries.size = 32 := rfl

def entry0053 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0053.entries[i.val]'(by rw [size0053]; exact i.isLt)

theorem fields0053 (i : Fin 32) :
    (entry0053 i).IA = shift ∧ (entry0053 i).ID = S (163 + i.val + 1) ∧
      (entry0053 i).IC = S 4 ∧ (entry0053 i).Inext = T 3 (163 + i.val + 1) ∧
      (entry0053 i).Icur = T 3 (163 + i.val) ∧
      (entry0053 i).output = T 4 (163 + i.val) ∧
      (entry0053 i).charge = charge 3 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0053 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 4) (T 3 (163 + i.val + 1))
      (T 3 (163 + i.val)) (T 4 (163 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0053.entries OriginalRow227TriangleForward0053.checked
    ⟨i.val, by rw [size0053]; exact i.isLt⟩
  change (entry0053 i).check = true at h
  rcases fields0053 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0054 : OriginalRow227TriangleForward0054.entries.size = 32 := rfl

def entry0054 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0054.entries[i.val]'(by rw [size0054]; exact i.isLt)

theorem fields0054 (i : Fin 32) :
    (entry0054 i).IA = shift ∧ (entry0054 i).ID = S (195 + i.val + 1) ∧
      (entry0054 i).IC = S 4 ∧ (entry0054 i).Inext = T 3 (195 + i.val + 1) ∧
      (entry0054 i).Icur = T 3 (195 + i.val) ∧
      (entry0054 i).output = T 4 (195 + i.val) ∧
      (entry0054 i).charge = charge 3 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0054_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0054 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 4) (T 3 (195 + i.val + 1))
      (T 3 (195 + i.val)) (T 4 (195 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0054.entries OriginalRow227TriangleForward0054.checked
    ⟨i.val, by rw [size0054]; exact i.isLt⟩
  change (entry0054 i).check = true at h
  rcases fields0054 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0055 : OriginalRow227TriangleForward0055.entries.size = 32 := rfl

def entry0055 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0055.entries[i.val]'(by rw [size0055]; exact i.isLt)

theorem fields0055 (i : Fin 32) :
    (entry0055 i).IA = shift ∧ (entry0055 i).ID = S (227 + i.val + 1) ∧
      (entry0055 i).IC = S 4 ∧ (entry0055 i).Inext = T 3 (227 + i.val + 1) ∧
      (entry0055 i).Icur = T 3 (227 + i.val) ∧
      (entry0055 i).output = T 4 (227 + i.val) ∧
      (entry0055 i).charge = charge 3 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0055_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0055 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 4) (T 3 (227 + i.val + 1))
      (T 3 (227 + i.val)) (T 4 (227 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0055.entries OriginalRow227TriangleForward0055.checked
    ⟨i.val, by rw [size0055]; exact i.isLt⟩
  change (entry0055 i).check = true at h
  rcases fields0055 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0056 : OriginalRow227TriangleForward0056.entries.size = 32 := rfl

def entry0056 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0056.entries[i.val]'(by rw [size0056]; exact i.isLt)

theorem fields0056 (i : Fin 32) :
    (entry0056 i).IA = shift ∧ (entry0056 i).ID = S (259 + i.val + 1) ∧
      (entry0056 i).IC = S 4 ∧ (entry0056 i).Inext = T 3 (259 + i.val + 1) ∧
      (entry0056 i).Icur = T 3 (259 + i.val) ∧
      (entry0056 i).output = T 4 (259 + i.val) ∧
      (entry0056 i).charge = charge 3 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0056 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 4) (T 3 (259 + i.val + 1))
      (T 3 (259 + i.val)) (T 4 (259 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0056.entries OriginalRow227TriangleForward0056.checked
    ⟨i.val, by rw [size0056]; exact i.isLt⟩
  change (entry0056 i).check = true at h
  rcases fields0056 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0057 : OriginalRow227TriangleForward0057.entries.size = 32 := rfl

def entry0057 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0057.entries[i.val]'(by rw [size0057]; exact i.isLt)

theorem fields0057 (i : Fin 32) :
    (entry0057 i).IA = shift ∧ (entry0057 i).ID = S (291 + i.val + 1) ∧
      (entry0057 i).IC = S 4 ∧ (entry0057 i).Inext = T 3 (291 + i.val + 1) ∧
      (entry0057 i).Icur = T 3 (291 + i.val) ∧
      (entry0057 i).output = T 4 (291 + i.val) ∧
      (entry0057 i).charge = charge 3 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0057_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0057 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 4) (T 3 (291 + i.val + 1))
      (T 3 (291 + i.val)) (T 4 (291 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0057.entries OriginalRow227TriangleForward0057.checked
    ⟨i.val, by rw [size0057]; exact i.isLt⟩
  change (entry0057 i).check = true at h
  rcases fields0057 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0058 : OriginalRow227TriangleForward0058.entries.size = 32 := rfl

def entry0058 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0058.entries[i.val]'(by rw [size0058]; exact i.isLt)

theorem fields0058 (i : Fin 32) :
    (entry0058 i).IA = shift ∧ (entry0058 i).ID = S (323 + i.val + 1) ∧
      (entry0058 i).IC = S 4 ∧ (entry0058 i).Inext = T 3 (323 + i.val + 1) ∧
      (entry0058 i).Icur = T 3 (323 + i.val) ∧
      (entry0058 i).output = T 4 (323 + i.val) ∧
      (entry0058 i).charge = charge 3 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0058 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 4) (T 3 (323 + i.val + 1))
      (T 3 (323 + i.val)) (T 4 (323 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0058.entries OriginalRow227TriangleForward0058.checked
    ⟨i.val, by rw [size0058]; exact i.isLt⟩
  change (entry0058 i).check = true at h
  rcases fields0058 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0059 : OriginalRow227TriangleForward0059.entries.size = 32 := rfl

def entry0059 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0059.entries[i.val]'(by rw [size0059]; exact i.isLt)

theorem fields0059 (i : Fin 32) :
    (entry0059 i).IA = shift ∧ (entry0059 i).ID = S (355 + i.val + 1) ∧
      (entry0059 i).IC = S 4 ∧ (entry0059 i).Inext = T 3 (355 + i.val + 1) ∧
      (entry0059 i).Icur = T 3 (355 + i.val) ∧
      (entry0059 i).output = T 4 (355 + i.val) ∧
      (entry0059 i).charge = charge 3 (355 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0059 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (355 + i.val)) shift
      (S (355 + i.val + 1)) (S 4) (T 3 (355 + i.val + 1))
      (T 3 (355 + i.val)) (T 4 (355 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0059.entries OriginalRow227TriangleForward0059.checked
    ⟨i.val, by rw [size0059]; exact i.isLt⟩
  change (entry0059 i).check = true at h
  rcases fields0059 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0060 : OriginalRow227TriangleForward0060.entries.size = 32 := rfl

def entry0060 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0060.entries[i.val]'(by rw [size0060]; exact i.isLt)

theorem fields0060 (i : Fin 32) :
    (entry0060 i).IA = shift ∧ (entry0060 i).ID = S (387 + i.val + 1) ∧
      (entry0060 i).IC = S 4 ∧ (entry0060 i).Inext = T 3 (387 + i.val + 1) ∧
      (entry0060 i).Icur = T 3 (387 + i.val) ∧
      (entry0060 i).output = T 4 (387 + i.val) ∧
      (entry0060 i).charge = charge 3 (387 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0060_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0060 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (387 + i.val)) shift
      (S (387 + i.val + 1)) (S 4) (T 3 (387 + i.val + 1))
      (T 3 (387 + i.val)) (T 4 (387 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0060.entries OriginalRow227TriangleForward0060.checked
    ⟨i.val, by rw [size0060]; exact i.isLt⟩
  change (entry0060 i).check = true at h
  rcases fields0060 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0061 : OriginalRow227TriangleForward0061.entries.size = 32 := rfl

def entry0061 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0061.entries[i.val]'(by rw [size0061]; exact i.isLt)

theorem fields0061 (i : Fin 32) :
    (entry0061 i).IA = shift ∧ (entry0061 i).ID = S (419 + i.val + 1) ∧
      (entry0061 i).IC = S 4 ∧ (entry0061 i).Inext = T 3 (419 + i.val + 1) ∧
      (entry0061 i).Icur = T 3 (419 + i.val) ∧
      (entry0061 i).output = T 4 (419 + i.val) ∧
      (entry0061 i).charge = charge 3 (419 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0061 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (419 + i.val)) shift
      (S (419 + i.val + 1)) (S 4) (T 3 (419 + i.val + 1))
      (T 3 (419 + i.val)) (T 4 (419 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0061.entries OriginalRow227TriangleForward0061.checked
    ⟨i.val, by rw [size0061]; exact i.isLt⟩
  change (entry0061 i).check = true at h
  rcases fields0061 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0062 : OriginalRow227TriangleForward0062.entries.size = 32 := rfl

def entry0062 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0062.entries[i.val]'(by rw [size0062]; exact i.isLt)

theorem fields0062 (i : Fin 32) :
    (entry0062 i).IA = shift ∧ (entry0062 i).ID = S (451 + i.val + 1) ∧
      (entry0062 i).IC = S 4 ∧ (entry0062 i).Inext = T 3 (451 + i.val + 1) ∧
      (entry0062 i).Icur = T 3 (451 + i.val) ∧
      (entry0062 i).output = T 4 (451 + i.val) ∧
      (entry0062 i).charge = charge 3 (451 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0062 (i : Fin 32) :
    forwardStepOK (-768) (charge 3 (451 + i.val)) shift
      (S (451 + i.val + 1)) (S 4) (T 3 (451 + i.val + 1))
      (T 3 (451 + i.val)) (T 4 (451 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0062.entries OriginalRow227TriangleForward0062.checked
    ⟨i.val, by rw [size0062]; exact i.isLt⟩
  change (entry0062 i).check = true at h
  rcases fields0062 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0063 : OriginalRow227TriangleForward0063.entries.size = 15 := rfl

def entry0063 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0063.entries[i.val]'(by rw [size0063]; exact i.isLt)

theorem fields0063 (i : Fin 15) :
    (entry0063 i).IA = shift ∧ (entry0063 i).ID = S (483 + i.val + 1) ∧
      (entry0063 i).IC = S 4 ∧ (entry0063 i).Inext = T 3 (483 + i.val + 1) ∧
      (entry0063 i).Icur = T 3 (483 + i.val) ∧
      (entry0063 i).output = T 4 (483 + i.val) ∧
      (entry0063 i).charge = charge 3 (483 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root497).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root498).symm, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow003.block0063_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨14, by decide⟩).symm, rfl⟩

theorem step0063 (i : Fin 15) :
    forwardStepOK (-768) (charge 3 (483 + i.val)) shift
      (S (483 + i.val + 1)) (S 4) (T 3 (483 + i.val + 1))
      (T 3 (483 + i.val)) (T 4 (483 + i.val))
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0063.entries OriginalRow227TriangleForward0063.checked
    ⟨i.val, by rw [size0063]; exact i.isLt⟩
  change (entry0063 i).check = true at h
  rcases fields0063 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 3 ≤ d) (hhi : d < 498) :
    forwardStepOK (-768) (charge 3 d) shift (S (d + 1)) (S 4)
      (T 3 (d + 1)) (T 3 d) (T 4 d)
      (OriginalRow227Roots.root_pos 4 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 3 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h131 : d < 131
    ·
      by_cases h67 : d < 67
      ·
        by_cases h35 : d < 35
        ·
          have hi : d - 3 < 32 := by omega
          have heq : 3 + (d - 3) = d := by omega
          simpa only [heq] using step0048 ⟨d - 3, hi⟩
        ·
          have hi : d - 35 < 32 := by omega
          have heq : 35 + (d - 35) = d := by omega
          simpa only [heq] using step0049 ⟨d - 35, hi⟩
      ·
        by_cases h99 : d < 99
        ·
          have hi : d - 67 < 32 := by omega
          have heq : 67 + (d - 67) = d := by omega
          simpa only [heq] using step0050 ⟨d - 67, hi⟩
        ·
          have hi : d - 99 < 32 := by omega
          have heq : 99 + (d - 99) = d := by omega
          simpa only [heq] using step0051 ⟨d - 99, hi⟩
    ·
      by_cases h195 : d < 195
      ·
        by_cases h163 : d < 163
        ·
          have hi : d - 131 < 32 := by omega
          have heq : 131 + (d - 131) = d := by omega
          simpa only [heq] using step0052 ⟨d - 131, hi⟩
        ·
          have hi : d - 163 < 32 := by omega
          have heq : 163 + (d - 163) = d := by omega
          simpa only [heq] using step0053 ⟨d - 163, hi⟩
      ·
        by_cases h227 : d < 227
        ·
          have hi : d - 195 < 32 := by omega
          have heq : 195 + (d - 195) = d := by omega
          simpa only [heq] using step0054 ⟨d - 195, hi⟩
        ·
          have hi : d - 227 < 32 := by omega
          have heq : 227 + (d - 227) = d := by omega
          simpa only [heq] using step0055 ⟨d - 227, hi⟩
  ·
    by_cases h387 : d < 387
    ·
      by_cases h323 : d < 323
      ·
        by_cases h291 : d < 291
        ·
          have hi : d - 259 < 32 := by omega
          have heq : 259 + (d - 259) = d := by omega
          simpa only [heq] using step0056 ⟨d - 259, hi⟩
        ·
          have hi : d - 291 < 32 := by omega
          have heq : 291 + (d - 291) = d := by omega
          simpa only [heq] using step0057 ⟨d - 291, hi⟩
      ·
        by_cases h355 : d < 355
        ·
          have hi : d - 323 < 32 := by omega
          have heq : 323 + (d - 323) = d := by omega
          simpa only [heq] using step0058 ⟨d - 323, hi⟩
        ·
          have hi : d - 355 < 32 := by omega
          have heq : 355 + (d - 355) = d := by omega
          simpa only [heq] using step0059 ⟨d - 355, hi⟩
    ·
      by_cases h451 : d < 451
      ·
        by_cases h419 : d < 419
        ·
          have hi : d - 387 < 32 := by omega
          have heq : 387 + (d - 387) = d := by omega
          simpa only [heq] using step0060 ⟨d - 387, hi⟩
        ·
          have hi : d - 419 < 32 := by omega
          have heq : 419 + (d - 419) = d := by omega
          simpa only [heq] using step0061 ⟨d - 419, hi⟩
      ·
        by_cases h483 : d < 483
        ·
          have hi : d - 451 < 32 := by omega
          have heq : 451 + (d - 451) = d := by omega
          simpa only [heq] using step0062 ⟨d - 451, hi⟩
        ·
          have hi : d - 483 < 15 := by omega
          have heq : 483 + (d - 483) = d := by omega
          simpa only [heq] using step0063 ⟨d - 483, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.fields0063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.step0063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow004
