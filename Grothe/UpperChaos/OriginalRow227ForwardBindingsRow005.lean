import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005
import Grothe.UpperChaos.OriginalRow227TriangleForward0064
import Grothe.UpperChaos.OriginalRow227TriangleForward0065
import Grothe.UpperChaos.OriginalRow227TriangleForward0066
import Grothe.UpperChaos.OriginalRow227TriangleForward0067
import Grothe.UpperChaos.OriginalRow227TriangleForward0068
import Grothe.UpperChaos.OriginalRow227TriangleForward0069
import Grothe.UpperChaos.OriginalRow227TriangleForward0070
import Grothe.UpperChaos.OriginalRow227TriangleForward0071
import Grothe.UpperChaos.OriginalRow227TriangleForward0072
import Grothe.UpperChaos.OriginalRow227TriangleForward0073
import Grothe.UpperChaos.OriginalRow227TriangleForward0074
import Grothe.UpperChaos.OriginalRow227TriangleForward0075
import Grothe.UpperChaos.OriginalRow227TriangleForward0076
import Grothe.UpperChaos.OriginalRow227TriangleForward0077
import Grothe.UpperChaos.OriginalRow227TriangleForward0078
import Grothe.UpperChaos.OriginalRow227TriangleForward0079

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0064 : OriginalRow227TriangleForward0064.entries.size = 32 := rfl

def entry0064 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0064.entries[i.val]'(by rw [size0064]; exact i.isLt)

theorem fields0064 (i : Fin 32) :
    (entry0064 i).IA = shift ∧ (entry0064 i).ID = S (4 + i.val + 1) ∧
      (entry0064 i).IC = S 5 ∧ (entry0064 i).Inext = T 4 (4 + i.val + 1) ∧
      (entry0064 i).Icur = T 4 (4 + i.val) ∧
      (entry0064 i).output = T 5 (4 + i.val) ∧
      (entry0064 i).charge = charge 4 (4 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root5).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0064 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (4 + i.val)) shift
      (S (4 + i.val + 1)) (S 5) (T 4 (4 + i.val + 1))
      (T 4 (4 + i.val)) (T 5 (4 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0064.entries OriginalRow227TriangleForward0064.checked
    ⟨i.val, by rw [size0064]; exact i.isLt⟩
  change (entry0064 i).check = true at h
  rcases fields0064 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0065 : OriginalRow227TriangleForward0065.entries.size = 32 := rfl

def entry0065 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0065.entries[i.val]'(by rw [size0065]; exact i.isLt)

theorem fields0065 (i : Fin 32) :
    (entry0065 i).IA = shift ∧ (entry0065 i).ID = S (36 + i.val + 1) ∧
      (entry0065 i).IC = S 5 ∧ (entry0065 i).Inext = T 4 (36 + i.val + 1) ∧
      (entry0065 i).Icur = T 4 (36 + i.val) ∧
      (entry0065 i).output = T 5 (36 + i.val) ∧
      (entry0065 i).charge = charge 4 (36 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0065_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0065 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (36 + i.val)) shift
      (S (36 + i.val + 1)) (S 5) (T 4 (36 + i.val + 1))
      (T 4 (36 + i.val)) (T 5 (36 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0065.entries OriginalRow227TriangleForward0065.checked
    ⟨i.val, by rw [size0065]; exact i.isLt⟩
  change (entry0065 i).check = true at h
  rcases fields0065 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0066 : OriginalRow227TriangleForward0066.entries.size = 32 := rfl

def entry0066 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0066.entries[i.val]'(by rw [size0066]; exact i.isLt)

theorem fields0066 (i : Fin 32) :
    (entry0066 i).IA = shift ∧ (entry0066 i).ID = S (68 + i.val + 1) ∧
      (entry0066 i).IC = S 5 ∧ (entry0066 i).Inext = T 4 (68 + i.val + 1) ∧
      (entry0066 i).Icur = T 4 (68 + i.val) ∧
      (entry0066 i).output = T 5 (68 + i.val) ∧
      (entry0066 i).charge = charge 4 (68 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0066_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0066 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (68 + i.val)) shift
      (S (68 + i.val + 1)) (S 5) (T 4 (68 + i.val + 1))
      (T 4 (68 + i.val)) (T 5 (68 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0066.entries OriginalRow227TriangleForward0066.checked
    ⟨i.val, by rw [size0066]; exact i.isLt⟩
  change (entry0066 i).check = true at h
  rcases fields0066 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0067 : OriginalRow227TriangleForward0067.entries.size = 32 := rfl

def entry0067 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0067.entries[i.val]'(by rw [size0067]; exact i.isLt)

theorem fields0067 (i : Fin 32) :
    (entry0067 i).IA = shift ∧ (entry0067 i).ID = S (100 + i.val + 1) ∧
      (entry0067 i).IC = S 5 ∧ (entry0067 i).Inext = T 4 (100 + i.val + 1) ∧
      (entry0067 i).Icur = T 4 (100 + i.val) ∧
      (entry0067 i).output = T 5 (100 + i.val) ∧
      (entry0067 i).charge = charge 4 (100 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0067_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0067 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (100 + i.val)) shift
      (S (100 + i.val + 1)) (S 5) (T 4 (100 + i.val + 1))
      (T 4 (100 + i.val)) (T 5 (100 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0067.entries OriginalRow227TriangleForward0067.checked
    ⟨i.val, by rw [size0067]; exact i.isLt⟩
  change (entry0067 i).check = true at h
  rcases fields0067 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0068 : OriginalRow227TriangleForward0068.entries.size = 32 := rfl

def entry0068 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0068.entries[i.val]'(by rw [size0068]; exact i.isLt)

theorem fields0068 (i : Fin 32) :
    (entry0068 i).IA = shift ∧ (entry0068 i).ID = S (132 + i.val + 1) ∧
      (entry0068 i).IC = S 5 ∧ (entry0068 i).Inext = T 4 (132 + i.val + 1) ∧
      (entry0068 i).Icur = T 4 (132 + i.val) ∧
      (entry0068 i).output = T 5 (132 + i.val) ∧
      (entry0068 i).charge = charge 4 (132 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0068 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (132 + i.val)) shift
      (S (132 + i.val + 1)) (S 5) (T 4 (132 + i.val + 1))
      (T 4 (132 + i.val)) (T 5 (132 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0068.entries OriginalRow227TriangleForward0068.checked
    ⟨i.val, by rw [size0068]; exact i.isLt⟩
  change (entry0068 i).check = true at h
  rcases fields0068 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0069 : OriginalRow227TriangleForward0069.entries.size = 32 := rfl

def entry0069 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0069.entries[i.val]'(by rw [size0069]; exact i.isLt)

theorem fields0069 (i : Fin 32) :
    (entry0069 i).IA = shift ∧ (entry0069 i).ID = S (164 + i.val + 1) ∧
      (entry0069 i).IC = S 5 ∧ (entry0069 i).Inext = T 4 (164 + i.val + 1) ∧
      (entry0069 i).Icur = T 4 (164 + i.val) ∧
      (entry0069 i).output = T 5 (164 + i.val) ∧
      (entry0069 i).charge = charge 4 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0069_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0069 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 5) (T 4 (164 + i.val + 1))
      (T 4 (164 + i.val)) (T 5 (164 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0069.entries OriginalRow227TriangleForward0069.checked
    ⟨i.val, by rw [size0069]; exact i.isLt⟩
  change (entry0069 i).check = true at h
  rcases fields0069 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0070 : OriginalRow227TriangleForward0070.entries.size = 32 := rfl

def entry0070 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0070.entries[i.val]'(by rw [size0070]; exact i.isLt)

theorem fields0070 (i : Fin 32) :
    (entry0070 i).IA = shift ∧ (entry0070 i).ID = S (196 + i.val + 1) ∧
      (entry0070 i).IC = S 5 ∧ (entry0070 i).Inext = T 4 (196 + i.val + 1) ∧
      (entry0070 i).Icur = T 4 (196 + i.val) ∧
      (entry0070 i).output = T 5 (196 + i.val) ∧
      (entry0070 i).charge = charge 4 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0070 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 5) (T 4 (196 + i.val + 1))
      (T 4 (196 + i.val)) (T 5 (196 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0070.entries OriginalRow227TriangleForward0070.checked
    ⟨i.val, by rw [size0070]; exact i.isLt⟩
  change (entry0070 i).check = true at h
  rcases fields0070 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0071 : OriginalRow227TriangleForward0071.entries.size = 32 := rfl

def entry0071 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0071.entries[i.val]'(by rw [size0071]; exact i.isLt)

theorem fields0071 (i : Fin 32) :
    (entry0071 i).IA = shift ∧ (entry0071 i).ID = S (228 + i.val + 1) ∧
      (entry0071 i).IC = S 5 ∧ (entry0071 i).Inext = T 4 (228 + i.val + 1) ∧
      (entry0071 i).Icur = T 4 (228 + i.val) ∧
      (entry0071 i).output = T 5 (228 + i.val) ∧
      (entry0071 i).charge = charge 4 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0071_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0071 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 5) (T 4 (228 + i.val + 1))
      (T 4 (228 + i.val)) (T 5 (228 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0071.entries OriginalRow227TriangleForward0071.checked
    ⟨i.val, by rw [size0071]; exact i.isLt⟩
  change (entry0071 i).check = true at h
  rcases fields0071 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0072 : OriginalRow227TriangleForward0072.entries.size = 32 := rfl

def entry0072 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0072.entries[i.val]'(by rw [size0072]; exact i.isLt)

theorem fields0072 (i : Fin 32) :
    (entry0072 i).IA = shift ∧ (entry0072 i).ID = S (260 + i.val + 1) ∧
      (entry0072 i).IC = S 5 ∧ (entry0072 i).Inext = T 4 (260 + i.val + 1) ∧
      (entry0072 i).Icur = T 4 (260 + i.val) ∧
      (entry0072 i).output = T 5 (260 + i.val) ∧
      (entry0072 i).charge = charge 4 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0072 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 5) (T 4 (260 + i.val + 1))
      (T 4 (260 + i.val)) (T 5 (260 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0072.entries OriginalRow227TriangleForward0072.checked
    ⟨i.val, by rw [size0072]; exact i.isLt⟩
  change (entry0072 i).check = true at h
  rcases fields0072 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0073 : OriginalRow227TriangleForward0073.entries.size = 32 := rfl

def entry0073 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0073.entries[i.val]'(by rw [size0073]; exact i.isLt)

theorem fields0073 (i : Fin 32) :
    (entry0073 i).IA = shift ∧ (entry0073 i).ID = S (292 + i.val + 1) ∧
      (entry0073 i).IC = S 5 ∧ (entry0073 i).Inext = T 4 (292 + i.val + 1) ∧
      (entry0073 i).Icur = T 4 (292 + i.val) ∧
      (entry0073 i).output = T 5 (292 + i.val) ∧
      (entry0073 i).charge = charge 4 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0073_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0073 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 5) (T 4 (292 + i.val + 1))
      (T 4 (292 + i.val)) (T 5 (292 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0073.entries OriginalRow227TriangleForward0073.checked
    ⟨i.val, by rw [size0073]; exact i.isLt⟩
  change (entry0073 i).check = true at h
  rcases fields0073 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0074 : OriginalRow227TriangleForward0074.entries.size = 32 := rfl

def entry0074 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0074.entries[i.val]'(by rw [size0074]; exact i.isLt)

theorem fields0074 (i : Fin 32) :
    (entry0074 i).IA = shift ∧ (entry0074 i).ID = S (324 + i.val + 1) ∧
      (entry0074 i).IC = S 5 ∧ (entry0074 i).Inext = T 4 (324 + i.val + 1) ∧
      (entry0074 i).Icur = T 4 (324 + i.val) ∧
      (entry0074 i).output = T 5 (324 + i.val) ∧
      (entry0074 i).charge = charge 4 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0074 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 5) (T 4 (324 + i.val + 1))
      (T 4 (324 + i.val)) (T 5 (324 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0074.entries OriginalRow227TriangleForward0074.checked
    ⟨i.val, by rw [size0074]; exact i.isLt⟩
  change (entry0074 i).check = true at h
  rcases fields0074 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0075 : OriginalRow227TriangleForward0075.entries.size = 32 := rfl

def entry0075 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0075.entries[i.val]'(by rw [size0075]; exact i.isLt)

theorem fields0075 (i : Fin 32) :
    (entry0075 i).IA = shift ∧ (entry0075 i).ID = S (356 + i.val + 1) ∧
      (entry0075 i).IC = S 5 ∧ (entry0075 i).Inext = T 4 (356 + i.val + 1) ∧
      (entry0075 i).Icur = T 4 (356 + i.val) ∧
      (entry0075 i).output = T 5 (356 + i.val) ∧
      (entry0075 i).charge = charge 4 (356 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0075_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0075 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (356 + i.val)) shift
      (S (356 + i.val + 1)) (S 5) (T 4 (356 + i.val + 1))
      (T 4 (356 + i.val)) (T 5 (356 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0075.entries OriginalRow227TriangleForward0075.checked
    ⟨i.val, by rw [size0075]; exact i.isLt⟩
  change (entry0075 i).check = true at h
  rcases fields0075 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0076 : OriginalRow227TriangleForward0076.entries.size = 32 := rfl

def entry0076 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0076.entries[i.val]'(by rw [size0076]; exact i.isLt)

theorem fields0076 (i : Fin 32) :
    (entry0076 i).IA = shift ∧ (entry0076 i).ID = S (388 + i.val + 1) ∧
      (entry0076 i).IC = S 5 ∧ (entry0076 i).Inext = T 4 (388 + i.val + 1) ∧
      (entry0076 i).Icur = T 4 (388 + i.val) ∧
      (entry0076 i).output = T 5 (388 + i.val) ∧
      (entry0076 i).charge = charge 4 (388 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0076 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (388 + i.val)) shift
      (S (388 + i.val + 1)) (S 5) (T 4 (388 + i.val + 1))
      (T 4 (388 + i.val)) (T 5 (388 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0076.entries OriginalRow227TriangleForward0076.checked
    ⟨i.val, by rw [size0076]; exact i.isLt⟩
  change (entry0076 i).check = true at h
  rcases fields0076 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0077 : OriginalRow227TriangleForward0077.entries.size = 32 := rfl

def entry0077 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0077.entries[i.val]'(by rw [size0077]; exact i.isLt)

theorem fields0077 (i : Fin 32) :
    (entry0077 i).IA = shift ∧ (entry0077 i).ID = S (420 + i.val + 1) ∧
      (entry0077 i).IC = S 5 ∧ (entry0077 i).Inext = T 4 (420 + i.val + 1) ∧
      (entry0077 i).Icur = T 4 (420 + i.val) ∧
      (entry0077 i).output = T 5 (420 + i.val) ∧
      (entry0077 i).charge = charge 4 (420 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0077_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0077 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (420 + i.val)) shift
      (S (420 + i.val + 1)) (S 5) (T 4 (420 + i.val + 1))
      (T 4 (420 + i.val)) (T 5 (420 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0077.entries OriginalRow227TriangleForward0077.checked
    ⟨i.val, by rw [size0077]; exact i.isLt⟩
  change (entry0077 i).check = true at h
  rcases fields0077 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0078 : OriginalRow227TriangleForward0078.entries.size = 32 := rfl

def entry0078 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0078.entries[i.val]'(by rw [size0078]; exact i.isLt)

theorem fields0078 (i : Fin 32) :
    (entry0078 i).IA = shift ∧ (entry0078 i).ID = S (452 + i.val + 1) ∧
      (entry0078 i).IC = S 5 ∧ (entry0078 i).Inext = T 4 (452 + i.val + 1) ∧
      (entry0078 i).Icur = T 4 (452 + i.val) ∧
      (entry0078 i).output = T 5 (452 + i.val) ∧
      (entry0078 i).charge = charge 4 (452 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0078 (i : Fin 32) :
    forwardStepOK (-768) (charge 4 (452 + i.val)) shift
      (S (452 + i.val + 1)) (S 5) (T 4 (452 + i.val + 1))
      (T 4 (452 + i.val)) (T 5 (452 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0078.entries OriginalRow227TriangleForward0078.checked
    ⟨i.val, by rw [size0078]; exact i.isLt⟩
  change (entry0078 i).check = true at h
  rcases fields0078 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0079 : OriginalRow227TriangleForward0079.entries.size = 13 := rfl

def entry0079 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0079.entries[i.val]'(by rw [size0079]; exact i.isLt)

theorem fields0079 (i : Fin 13) :
    (entry0079 i).IA = shift ∧ (entry0079 i).ID = S (484 + i.val + 1) ∧
      (entry0079 i).IC = S 5 ∧ (entry0079 i).Inext = T 4 (484 + i.val + 1) ∧
      (entry0079 i).Icur = T 4 (484 + i.val) ∧
      (entry0079 i).output = T 5 (484 + i.val) ∧
      (entry0079 i).charge = charge 4 (484 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root497).symm, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow004.block0079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨12, by decide⟩).symm, rfl⟩

theorem step0079 (i : Fin 13) :
    forwardStepOK (-768) (charge 4 (484 + i.val)) shift
      (S (484 + i.val + 1)) (S 5) (T 4 (484 + i.val + 1))
      (T 4 (484 + i.val)) (T 5 (484 + i.val))
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0079.entries OriginalRow227TriangleForward0079.checked
    ⟨i.val, by rw [size0079]; exact i.isLt⟩
  change (entry0079 i).check = true at h
  rcases fields0079 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 4 ≤ d) (hhi : d < 497) :
    forwardStepOK (-768) (charge 4 d) shift (S (d + 1)) (S 5)
      (T 4 (d + 1)) (T 4 d) (T 5 d)
      (OriginalRow227Roots.root_pos 5 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 4 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h132 : d < 132
    ·
      by_cases h68 : d < 68
      ·
        by_cases h36 : d < 36
        ·
          have hi : d - 4 < 32 := by omega
          have heq : 4 + (d - 4) = d := by omega
          simpa only [heq] using step0064 ⟨d - 4, hi⟩
        ·
          have hi : d - 36 < 32 := by omega
          have heq : 36 + (d - 36) = d := by omega
          simpa only [heq] using step0065 ⟨d - 36, hi⟩
      ·
        by_cases h100 : d < 100
        ·
          have hi : d - 68 < 32 := by omega
          have heq : 68 + (d - 68) = d := by omega
          simpa only [heq] using step0066 ⟨d - 68, hi⟩
        ·
          have hi : d - 100 < 32 := by omega
          have heq : 100 + (d - 100) = d := by omega
          simpa only [heq] using step0067 ⟨d - 100, hi⟩
    ·
      by_cases h196 : d < 196
      ·
        by_cases h164 : d < 164
        ·
          have hi : d - 132 < 32 := by omega
          have heq : 132 + (d - 132) = d := by omega
          simpa only [heq] using step0068 ⟨d - 132, hi⟩
        ·
          have hi : d - 164 < 32 := by omega
          have heq : 164 + (d - 164) = d := by omega
          simpa only [heq] using step0069 ⟨d - 164, hi⟩
      ·
        by_cases h228 : d < 228
        ·
          have hi : d - 196 < 32 := by omega
          have heq : 196 + (d - 196) = d := by omega
          simpa only [heq] using step0070 ⟨d - 196, hi⟩
        ·
          have hi : d - 228 < 32 := by omega
          have heq : 228 + (d - 228) = d := by omega
          simpa only [heq] using step0071 ⟨d - 228, hi⟩
  ·
    by_cases h388 : d < 388
    ·
      by_cases h324 : d < 324
      ·
        by_cases h292 : d < 292
        ·
          have hi : d - 260 < 32 := by omega
          have heq : 260 + (d - 260) = d := by omega
          simpa only [heq] using step0072 ⟨d - 260, hi⟩
        ·
          have hi : d - 292 < 32 := by omega
          have heq : 292 + (d - 292) = d := by omega
          simpa only [heq] using step0073 ⟨d - 292, hi⟩
      ·
        by_cases h356 : d < 356
        ·
          have hi : d - 324 < 32 := by omega
          have heq : 324 + (d - 324) = d := by omega
          simpa only [heq] using step0074 ⟨d - 324, hi⟩
        ·
          have hi : d - 356 < 32 := by omega
          have heq : 356 + (d - 356) = d := by omega
          simpa only [heq] using step0075 ⟨d - 356, hi⟩
    ·
      by_cases h452 : d < 452
      ·
        by_cases h420 : d < 420
        ·
          have hi : d - 388 < 32 := by omega
          have heq : 388 + (d - 388) = d := by omega
          simpa only [heq] using step0076 ⟨d - 388, hi⟩
        ·
          have hi : d - 420 < 32 := by omega
          have heq : 420 + (d - 420) = d := by omega
          simpa only [heq] using step0077 ⟨d - 420, hi⟩
      ·
        by_cases h484 : d < 484
        ·
          have hi : d - 452 < 32 := by omega
          have heq : 452 + (d - 452) = d := by omega
          simpa only [heq] using step0078 ⟨d - 452, hi⟩
        ·
          have hi : d - 484 < 13 := by omega
          have heq : 484 + (d - 484) = d := by omega
          simpa only [heq] using step0079 ⟨d - 484, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.fields0079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.step0079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow005
