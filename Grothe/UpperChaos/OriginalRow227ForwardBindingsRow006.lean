import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006
import Grothe.UpperChaos.OriginalRow227TriangleForward0080
import Grothe.UpperChaos.OriginalRow227TriangleForward0081
import Grothe.UpperChaos.OriginalRow227TriangleForward0082
import Grothe.UpperChaos.OriginalRow227TriangleForward0083
import Grothe.UpperChaos.OriginalRow227TriangleForward0084
import Grothe.UpperChaos.OriginalRow227TriangleForward0085
import Grothe.UpperChaos.OriginalRow227TriangleForward0086
import Grothe.UpperChaos.OriginalRow227TriangleForward0087
import Grothe.UpperChaos.OriginalRow227TriangleForward0088
import Grothe.UpperChaos.OriginalRow227TriangleForward0089
import Grothe.UpperChaos.OriginalRow227TriangleForward0090
import Grothe.UpperChaos.OriginalRow227TriangleForward0091
import Grothe.UpperChaos.OriginalRow227TriangleForward0092
import Grothe.UpperChaos.OriginalRow227TriangleForward0093
import Grothe.UpperChaos.OriginalRow227TriangleForward0094
import Grothe.UpperChaos.OriginalRow227TriangleForward0095

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0080 : OriginalRow227TriangleForward0080.entries.size = 32 := rfl

def entry0080 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0080.entries[i.val]'(by rw [size0080]; exact i.isLt)

theorem fields0080 (i : Fin 32) :
    (entry0080 i).IA = shift ∧ (entry0080 i).ID = S (5 + i.val + 1) ∧
      (entry0080 i).IC = S 6 ∧ (entry0080 i).Inext = T 5 (5 + i.val + 1) ∧
      (entry0080 i).Icur = T 5 (5 + i.val) ∧
      (entry0080 i).output = T 6 (5 + i.val) ∧
      (entry0080 i).charge = charge 5 (5 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0080 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (5 + i.val)) shift
      (S (5 + i.val + 1)) (S 6) (T 5 (5 + i.val + 1))
      (T 5 (5 + i.val)) (T 6 (5 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0080.entries OriginalRow227TriangleForward0080.checked
    ⟨i.val, by rw [size0080]; exact i.isLt⟩
  change (entry0080 i).check = true at h
  rcases fields0080 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0081 : OriginalRow227TriangleForward0081.entries.size = 32 := rfl

def entry0081 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0081.entries[i.val]'(by rw [size0081]; exact i.isLt)

theorem fields0081 (i : Fin 32) :
    (entry0081 i).IA = shift ∧ (entry0081 i).ID = S (37 + i.val + 1) ∧
      (entry0081 i).IC = S 6 ∧ (entry0081 i).Inext = T 5 (37 + i.val + 1) ∧
      (entry0081 i).Icur = T 5 (37 + i.val) ∧
      (entry0081 i).output = T 6 (37 + i.val) ∧
      (entry0081 i).charge = charge 5 (37 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0081_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0081 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (37 + i.val)) shift
      (S (37 + i.val + 1)) (S 6) (T 5 (37 + i.val + 1))
      (T 5 (37 + i.val)) (T 6 (37 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0081.entries OriginalRow227TriangleForward0081.checked
    ⟨i.val, by rw [size0081]; exact i.isLt⟩
  change (entry0081 i).check = true at h
  rcases fields0081 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0082 : OriginalRow227TriangleForward0082.entries.size = 32 := rfl

def entry0082 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0082.entries[i.val]'(by rw [size0082]; exact i.isLt)

theorem fields0082 (i : Fin 32) :
    (entry0082 i).IA = shift ∧ (entry0082 i).ID = S (69 + i.val + 1) ∧
      (entry0082 i).IC = S 6 ∧ (entry0082 i).Inext = T 5 (69 + i.val + 1) ∧
      (entry0082 i).Icur = T 5 (69 + i.val) ∧
      (entry0082 i).output = T 6 (69 + i.val) ∧
      (entry0082 i).charge = charge 5 (69 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0082 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (69 + i.val)) shift
      (S (69 + i.val + 1)) (S 6) (T 5 (69 + i.val + 1))
      (T 5 (69 + i.val)) (T 6 (69 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0082.entries OriginalRow227TriangleForward0082.checked
    ⟨i.val, by rw [size0082]; exact i.isLt⟩
  change (entry0082 i).check = true at h
  rcases fields0082 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0083 : OriginalRow227TriangleForward0083.entries.size = 32 := rfl

def entry0083 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0083.entries[i.val]'(by rw [size0083]; exact i.isLt)

theorem fields0083 (i : Fin 32) :
    (entry0083 i).IA = shift ∧ (entry0083 i).ID = S (101 + i.val + 1) ∧
      (entry0083 i).IC = S 6 ∧ (entry0083 i).Inext = T 5 (101 + i.val + 1) ∧
      (entry0083 i).Icur = T 5 (101 + i.val) ∧
      (entry0083 i).output = T 6 (101 + i.val) ∧
      (entry0083 i).charge = charge 5 (101 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0083_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0083 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (101 + i.val)) shift
      (S (101 + i.val + 1)) (S 6) (T 5 (101 + i.val + 1))
      (T 5 (101 + i.val)) (T 6 (101 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0083.entries OriginalRow227TriangleForward0083.checked
    ⟨i.val, by rw [size0083]; exact i.isLt⟩
  change (entry0083 i).check = true at h
  rcases fields0083 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0084 : OriginalRow227TriangleForward0084.entries.size = 32 := rfl

def entry0084 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0084.entries[i.val]'(by rw [size0084]; exact i.isLt)

theorem fields0084 (i : Fin 32) :
    (entry0084 i).IA = shift ∧ (entry0084 i).ID = S (133 + i.val + 1) ∧
      (entry0084 i).IC = S 6 ∧ (entry0084 i).Inext = T 5 (133 + i.val + 1) ∧
      (entry0084 i).Icur = T 5 (133 + i.val) ∧
      (entry0084 i).output = T 6 (133 + i.val) ∧
      (entry0084 i).charge = charge 5 (133 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0084 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (133 + i.val)) shift
      (S (133 + i.val + 1)) (S 6) (T 5 (133 + i.val + 1))
      (T 5 (133 + i.val)) (T 6 (133 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0084.entries OriginalRow227TriangleForward0084.checked
    ⟨i.val, by rw [size0084]; exact i.isLt⟩
  change (entry0084 i).check = true at h
  rcases fields0084 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0085 : OriginalRow227TriangleForward0085.entries.size = 32 := rfl

def entry0085 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0085.entries[i.val]'(by rw [size0085]; exact i.isLt)

theorem fields0085 (i : Fin 32) :
    (entry0085 i).IA = shift ∧ (entry0085 i).ID = S (165 + i.val + 1) ∧
      (entry0085 i).IC = S 6 ∧ (entry0085 i).Inext = T 5 (165 + i.val + 1) ∧
      (entry0085 i).Icur = T 5 (165 + i.val) ∧
      (entry0085 i).output = T 6 (165 + i.val) ∧
      (entry0085 i).charge = charge 5 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0085_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0085 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 6) (T 5 (165 + i.val + 1))
      (T 5 (165 + i.val)) (T 6 (165 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0085.entries OriginalRow227TriangleForward0085.checked
    ⟨i.val, by rw [size0085]; exact i.isLt⟩
  change (entry0085 i).check = true at h
  rcases fields0085 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0086 : OriginalRow227TriangleForward0086.entries.size = 32 := rfl

def entry0086 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0086.entries[i.val]'(by rw [size0086]; exact i.isLt)

theorem fields0086 (i : Fin 32) :
    (entry0086 i).IA = shift ∧ (entry0086 i).ID = S (197 + i.val + 1) ∧
      (entry0086 i).IC = S 6 ∧ (entry0086 i).Inext = T 5 (197 + i.val + 1) ∧
      (entry0086 i).Icur = T 5 (197 + i.val) ∧
      (entry0086 i).output = T 6 (197 + i.val) ∧
      (entry0086 i).charge = charge 5 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0086 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 6) (T 5 (197 + i.val + 1))
      (T 5 (197 + i.val)) (T 6 (197 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0086.entries OriginalRow227TriangleForward0086.checked
    ⟨i.val, by rw [size0086]; exact i.isLt⟩
  change (entry0086 i).check = true at h
  rcases fields0086 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0087 : OriginalRow227TriangleForward0087.entries.size = 32 := rfl

def entry0087 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0087.entries[i.val]'(by rw [size0087]; exact i.isLt)

theorem fields0087 (i : Fin 32) :
    (entry0087 i).IA = shift ∧ (entry0087 i).ID = S (229 + i.val + 1) ∧
      (entry0087 i).IC = S 6 ∧ (entry0087 i).Inext = T 5 (229 + i.val + 1) ∧
      (entry0087 i).Icur = T 5 (229 + i.val) ∧
      (entry0087 i).output = T 6 (229 + i.val) ∧
      (entry0087 i).charge = charge 5 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0087_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0087 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 6) (T 5 (229 + i.val + 1))
      (T 5 (229 + i.val)) (T 6 (229 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0087.entries OriginalRow227TriangleForward0087.checked
    ⟨i.val, by rw [size0087]; exact i.isLt⟩
  change (entry0087 i).check = true at h
  rcases fields0087 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0088 : OriginalRow227TriangleForward0088.entries.size = 32 := rfl

def entry0088 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0088.entries[i.val]'(by rw [size0088]; exact i.isLt)

theorem fields0088 (i : Fin 32) :
    (entry0088 i).IA = shift ∧ (entry0088 i).ID = S (261 + i.val + 1) ∧
      (entry0088 i).IC = S 6 ∧ (entry0088 i).Inext = T 5 (261 + i.val + 1) ∧
      (entry0088 i).Icur = T 5 (261 + i.val) ∧
      (entry0088 i).output = T 6 (261 + i.val) ∧
      (entry0088 i).charge = charge 5 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0088_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0088 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 6) (T 5 (261 + i.val + 1))
      (T 5 (261 + i.val)) (T 6 (261 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0088.entries OriginalRow227TriangleForward0088.checked
    ⟨i.val, by rw [size0088]; exact i.isLt⟩
  change (entry0088 i).check = true at h
  rcases fields0088 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0089 : OriginalRow227TriangleForward0089.entries.size = 32 := rfl

def entry0089 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0089.entries[i.val]'(by rw [size0089]; exact i.isLt)

theorem fields0089 (i : Fin 32) :
    (entry0089 i).IA = shift ∧ (entry0089 i).ID = S (293 + i.val + 1) ∧
      (entry0089 i).IC = S 6 ∧ (entry0089 i).Inext = T 5 (293 + i.val + 1) ∧
      (entry0089 i).Icur = T 5 (293 + i.val) ∧
      (entry0089 i).output = T 6 (293 + i.val) ∧
      (entry0089 i).charge = charge 5 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0089_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0089 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 6) (T 5 (293 + i.val + 1))
      (T 5 (293 + i.val)) (T 6 (293 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0089.entries OriginalRow227TriangleForward0089.checked
    ⟨i.val, by rw [size0089]; exact i.isLt⟩
  change (entry0089 i).check = true at h
  rcases fields0089 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0090 : OriginalRow227TriangleForward0090.entries.size = 32 := rfl

def entry0090 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0090.entries[i.val]'(by rw [size0090]; exact i.isLt)

theorem fields0090 (i : Fin 32) :
    (entry0090 i).IA = shift ∧ (entry0090 i).ID = S (325 + i.val + 1) ∧
      (entry0090 i).IC = S 6 ∧ (entry0090 i).Inext = T 5 (325 + i.val + 1) ∧
      (entry0090 i).Icur = T 5 (325 + i.val) ∧
      (entry0090 i).output = T 6 (325 + i.val) ∧
      (entry0090 i).charge = charge 5 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0090 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 6) (T 5 (325 + i.val + 1))
      (T 5 (325 + i.val)) (T 6 (325 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0090.entries OriginalRow227TriangleForward0090.checked
    ⟨i.val, by rw [size0090]; exact i.isLt⟩
  change (entry0090 i).check = true at h
  rcases fields0090 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0091 : OriginalRow227TriangleForward0091.entries.size = 32 := rfl

def entry0091 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0091.entries[i.val]'(by rw [size0091]; exact i.isLt)

theorem fields0091 (i : Fin 32) :
    (entry0091 i).IA = shift ∧ (entry0091 i).ID = S (357 + i.val + 1) ∧
      (entry0091 i).IC = S 6 ∧ (entry0091 i).Inext = T 5 (357 + i.val + 1) ∧
      (entry0091 i).Icur = T 5 (357 + i.val) ∧
      (entry0091 i).output = T 6 (357 + i.val) ∧
      (entry0091 i).charge = charge 5 (357 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0091_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0091 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (357 + i.val)) shift
      (S (357 + i.val + 1)) (S 6) (T 5 (357 + i.val + 1))
      (T 5 (357 + i.val)) (T 6 (357 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0091.entries OriginalRow227TriangleForward0091.checked
    ⟨i.val, by rw [size0091]; exact i.isLt⟩
  change (entry0091 i).check = true at h
  rcases fields0091 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0092 : OriginalRow227TriangleForward0092.entries.size = 32 := rfl

def entry0092 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0092.entries[i.val]'(by rw [size0092]; exact i.isLt)

theorem fields0092 (i : Fin 32) :
    (entry0092 i).IA = shift ∧ (entry0092 i).ID = S (389 + i.val + 1) ∧
      (entry0092 i).IC = S 6 ∧ (entry0092 i).Inext = T 5 (389 + i.val + 1) ∧
      (entry0092 i).Icur = T 5 (389 + i.val) ∧
      (entry0092 i).output = T 6 (389 + i.val) ∧
      (entry0092 i).charge = charge 5 (389 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0092 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (389 + i.val)) shift
      (S (389 + i.val + 1)) (S 6) (T 5 (389 + i.val + 1))
      (T 5 (389 + i.val)) (T 6 (389 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0092.entries OriginalRow227TriangleForward0092.checked
    ⟨i.val, by rw [size0092]; exact i.isLt⟩
  change (entry0092 i).check = true at h
  rcases fields0092 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0093 : OriginalRow227TriangleForward0093.entries.size = 32 := rfl

def entry0093 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0093.entries[i.val]'(by rw [size0093]; exact i.isLt)

theorem fields0093 (i : Fin 32) :
    (entry0093 i).IA = shift ∧ (entry0093 i).ID = S (421 + i.val + 1) ∧
      (entry0093 i).IC = S 6 ∧ (entry0093 i).Inext = T 5 (421 + i.val + 1) ∧
      (entry0093 i).Icur = T 5 (421 + i.val) ∧
      (entry0093 i).output = T 6 (421 + i.val) ∧
      (entry0093 i).charge = charge 5 (421 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0093_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0093 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (421 + i.val)) shift
      (S (421 + i.val + 1)) (S 6) (T 5 (421 + i.val + 1))
      (T 5 (421 + i.val)) (T 6 (421 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0093.entries OriginalRow227TriangleForward0093.checked
    ⟨i.val, by rw [size0093]; exact i.isLt⟩
  change (entry0093 i).check = true at h
  rcases fields0093 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0094 : OriginalRow227TriangleForward0094.entries.size = 32 := rfl

def entry0094 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0094.entries[i.val]'(by rw [size0094]; exact i.isLt)

theorem fields0094 (i : Fin 32) :
    (entry0094 i).IA = shift ∧ (entry0094 i).ID = S (453 + i.val + 1) ∧
      (entry0094 i).IC = S 6 ∧ (entry0094 i).Inext = T 5 (453 + i.val + 1) ∧
      (entry0094 i).Icur = T 5 (453 + i.val) ∧
      (entry0094 i).output = T 6 (453 + i.val) ∧
      (entry0094 i).charge = charge 5 (453 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0094_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0094 (i : Fin 32) :
    forwardStepOK (-768) (charge 5 (453 + i.val)) shift
      (S (453 + i.val + 1)) (S 6) (T 5 (453 + i.val + 1))
      (T 5 (453 + i.val)) (T 6 (453 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0094.entries OriginalRow227TriangleForward0094.checked
    ⟨i.val, by rw [size0094]; exact i.isLt⟩
  change (entry0094 i).check = true at h
  rcases fields0094 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0095 : OriginalRow227TriangleForward0095.entries.size = 11 := rfl

def entry0095 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0095.entries[i.val]'(by rw [size0095]; exact i.isLt)

theorem fields0095 (i : Fin 11) :
    (entry0095 i).IA = shift ∧ (entry0095 i).ID = S (485 + i.val + 1) ∧
      (entry0095 i).IC = S 6 ∧ (entry0095 i).Inext = T 5 (485 + i.val + 1) ∧
      (entry0095 i).Icur = T 5 (485 + i.val) ∧
      (entry0095 i).output = T 6 (485 + i.val) ∧
      (entry0095 i).charge = charge 5 (485 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow005.block0095_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨10, by decide⟩).symm, rfl⟩

theorem step0095 (i : Fin 11) :
    forwardStepOK (-768) (charge 5 (485 + i.val)) shift
      (S (485 + i.val + 1)) (S 6) (T 5 (485 + i.val + 1))
      (T 5 (485 + i.val)) (T 6 (485 + i.val))
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0095.entries OriginalRow227TriangleForward0095.checked
    ⟨i.val, by rw [size0095]; exact i.isLt⟩
  change (entry0095 i).check = true at h
  rcases fields0095 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 5 ≤ d) (hhi : d < 496) :
    forwardStepOK (-768) (charge 5 d) shift (S (d + 1)) (S 6)
      (T 5 (d + 1)) (T 5 d) (T 6 d)
      (OriginalRow227Roots.root_pos 6 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 5 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h133 : d < 133
    ·
      by_cases h69 : d < 69
      ·
        by_cases h37 : d < 37
        ·
          have hi : d - 5 < 32 := by omega
          have heq : 5 + (d - 5) = d := by omega
          simpa only [heq] using step0080 ⟨d - 5, hi⟩
        ·
          have hi : d - 37 < 32 := by omega
          have heq : 37 + (d - 37) = d := by omega
          simpa only [heq] using step0081 ⟨d - 37, hi⟩
      ·
        by_cases h101 : d < 101
        ·
          have hi : d - 69 < 32 := by omega
          have heq : 69 + (d - 69) = d := by omega
          simpa only [heq] using step0082 ⟨d - 69, hi⟩
        ·
          have hi : d - 101 < 32 := by omega
          have heq : 101 + (d - 101) = d := by omega
          simpa only [heq] using step0083 ⟨d - 101, hi⟩
    ·
      by_cases h197 : d < 197
      ·
        by_cases h165 : d < 165
        ·
          have hi : d - 133 < 32 := by omega
          have heq : 133 + (d - 133) = d := by omega
          simpa only [heq] using step0084 ⟨d - 133, hi⟩
        ·
          have hi : d - 165 < 32 := by omega
          have heq : 165 + (d - 165) = d := by omega
          simpa only [heq] using step0085 ⟨d - 165, hi⟩
      ·
        by_cases h229 : d < 229
        ·
          have hi : d - 197 < 32 := by omega
          have heq : 197 + (d - 197) = d := by omega
          simpa only [heq] using step0086 ⟨d - 197, hi⟩
        ·
          have hi : d - 229 < 32 := by omega
          have heq : 229 + (d - 229) = d := by omega
          simpa only [heq] using step0087 ⟨d - 229, hi⟩
  ·
    by_cases h389 : d < 389
    ·
      by_cases h325 : d < 325
      ·
        by_cases h293 : d < 293
        ·
          have hi : d - 261 < 32 := by omega
          have heq : 261 + (d - 261) = d := by omega
          simpa only [heq] using step0088 ⟨d - 261, hi⟩
        ·
          have hi : d - 293 < 32 := by omega
          have heq : 293 + (d - 293) = d := by omega
          simpa only [heq] using step0089 ⟨d - 293, hi⟩
      ·
        by_cases h357 : d < 357
        ·
          have hi : d - 325 < 32 := by omega
          have heq : 325 + (d - 325) = d := by omega
          simpa only [heq] using step0090 ⟨d - 325, hi⟩
        ·
          have hi : d - 357 < 32 := by omega
          have heq : 357 + (d - 357) = d := by omega
          simpa only [heq] using step0091 ⟨d - 357, hi⟩
    ·
      by_cases h453 : d < 453
      ·
        by_cases h421 : d < 421
        ·
          have hi : d - 389 < 32 := by omega
          have heq : 389 + (d - 389) = d := by omega
          simpa only [heq] using step0092 ⟨d - 389, hi⟩
        ·
          have hi : d - 421 < 32 := by omega
          have heq : 421 + (d - 421) = d := by omega
          simpa only [heq] using step0093 ⟨d - 421, hi⟩
      ·
        by_cases h485 : d < 485
        ·
          have hi : d - 453 < 32 := by omega
          have heq : 453 + (d - 453) = d := by omega
          simpa only [heq] using step0094 ⟨d - 453, hi⟩
        ·
          have hi : d - 485 < 11 := by omega
          have heq : 485 + (d - 485) = d := by omega
          simpa only [heq] using step0095 ⟨d - 485, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0080,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0080,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0082,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0082,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0083,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0083,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0086,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0086,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0090,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0090,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.fields0095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.step0095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow006
