import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007
import Grothe.UpperChaos.OriginalRow227TriangleForward0096
import Grothe.UpperChaos.OriginalRow227TriangleForward0097
import Grothe.UpperChaos.OriginalRow227TriangleForward0098
import Grothe.UpperChaos.OriginalRow227TriangleForward0099
import Grothe.UpperChaos.OriginalRow227TriangleForward0100
import Grothe.UpperChaos.OriginalRow227TriangleForward0101
import Grothe.UpperChaos.OriginalRow227TriangleForward0102
import Grothe.UpperChaos.OriginalRow227TriangleForward0103
import Grothe.UpperChaos.OriginalRow227TriangleForward0104
import Grothe.UpperChaos.OriginalRow227TriangleForward0105
import Grothe.UpperChaos.OriginalRow227TriangleForward0106
import Grothe.UpperChaos.OriginalRow227TriangleForward0107
import Grothe.UpperChaos.OriginalRow227TriangleForward0108
import Grothe.UpperChaos.OriginalRow227TriangleForward0109
import Grothe.UpperChaos.OriginalRow227TriangleForward0110
import Grothe.UpperChaos.OriginalRow227TriangleForward0111

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0096 : OriginalRow227TriangleForward0096.entries.size = 32 := rfl

def entry0096 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0096.entries[i.val]'(by rw [size0096]; exact i.isLt)

theorem fields0096 (i : Fin 32) :
    (entry0096 i).IA = shift ∧ (entry0096 i).ID = S (6 + i.val + 1) ∧
      (entry0096 i).IC = S 7 ∧ (entry0096 i).Inext = T 6 (6 + i.val + 1) ∧
      (entry0096 i).Icur = T 6 (6 + i.val) ∧
      (entry0096 i).output = T 7 (6 + i.val) ∧
      (entry0096 i).charge = charge 6 (6 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0096_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0096 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (6 + i.val)) shift
      (S (6 + i.val + 1)) (S 7) (T 6 (6 + i.val + 1))
      (T 6 (6 + i.val)) (T 7 (6 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0096.entries OriginalRow227TriangleForward0096.checked
    ⟨i.val, by rw [size0096]; exact i.isLt⟩
  change (entry0096 i).check = true at h
  rcases fields0096 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0097 : OriginalRow227TriangleForward0097.entries.size = 32 := rfl

def entry0097 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0097.entries[i.val]'(by rw [size0097]; exact i.isLt)

theorem fields0097 (i : Fin 32) :
    (entry0097 i).IA = shift ∧ (entry0097 i).ID = S (38 + i.val + 1) ∧
      (entry0097 i).IC = S 7 ∧ (entry0097 i).Inext = T 6 (38 + i.val + 1) ∧
      (entry0097 i).Icur = T 6 (38 + i.val) ∧
      (entry0097 i).output = T 7 (38 + i.val) ∧
      (entry0097 i).charge = charge 6 (38 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0097_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0097 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (38 + i.val)) shift
      (S (38 + i.val + 1)) (S 7) (T 6 (38 + i.val + 1))
      (T 6 (38 + i.val)) (T 7 (38 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0097.entries OriginalRow227TriangleForward0097.checked
    ⟨i.val, by rw [size0097]; exact i.isLt⟩
  change (entry0097 i).check = true at h
  rcases fields0097 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0098 : OriginalRow227TriangleForward0098.entries.size = 32 := rfl

def entry0098 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0098.entries[i.val]'(by rw [size0098]; exact i.isLt)

theorem fields0098 (i : Fin 32) :
    (entry0098 i).IA = shift ∧ (entry0098 i).ID = S (70 + i.val + 1) ∧
      (entry0098 i).IC = S 7 ∧ (entry0098 i).Inext = T 6 (70 + i.val + 1) ∧
      (entry0098 i).Icur = T 6 (70 + i.val) ∧
      (entry0098 i).output = T 7 (70 + i.val) ∧
      (entry0098 i).charge = charge 6 (70 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0098_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0098 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (70 + i.val)) shift
      (S (70 + i.val + 1)) (S 7) (T 6 (70 + i.val + 1))
      (T 6 (70 + i.val)) (T 7 (70 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0098.entries OriginalRow227TriangleForward0098.checked
    ⟨i.val, by rw [size0098]; exact i.isLt⟩
  change (entry0098 i).check = true at h
  rcases fields0098 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0099 : OriginalRow227TriangleForward0099.entries.size = 32 := rfl

def entry0099 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0099.entries[i.val]'(by rw [size0099]; exact i.isLt)

theorem fields0099 (i : Fin 32) :
    (entry0099 i).IA = shift ∧ (entry0099 i).ID = S (102 + i.val + 1) ∧
      (entry0099 i).IC = S 7 ∧ (entry0099 i).Inext = T 6 (102 + i.val + 1) ∧
      (entry0099 i).Icur = T 6 (102 + i.val) ∧
      (entry0099 i).output = T 7 (102 + i.val) ∧
      (entry0099 i).charge = charge 6 (102 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0099_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0099 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (102 + i.val)) shift
      (S (102 + i.val + 1)) (S 7) (T 6 (102 + i.val + 1))
      (T 6 (102 + i.val)) (T 7 (102 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0099.entries OriginalRow227TriangleForward0099.checked
    ⟨i.val, by rw [size0099]; exact i.isLt⟩
  change (entry0099 i).check = true at h
  rcases fields0099 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0100 : OriginalRow227TriangleForward0100.entries.size = 32 := rfl

def entry0100 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0100.entries[i.val]'(by rw [size0100]; exact i.isLt)

theorem fields0100 (i : Fin 32) :
    (entry0100 i).IA = shift ∧ (entry0100 i).ID = S (134 + i.val + 1) ∧
      (entry0100 i).IC = S 7 ∧ (entry0100 i).Inext = T 6 (134 + i.val + 1) ∧
      (entry0100 i).Icur = T 6 (134 + i.val) ∧
      (entry0100 i).output = T 7 (134 + i.val) ∧
      (entry0100 i).charge = charge 6 (134 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0100_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0100 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (134 + i.val)) shift
      (S (134 + i.val + 1)) (S 7) (T 6 (134 + i.val + 1))
      (T 6 (134 + i.val)) (T 7 (134 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0100.entries OriginalRow227TriangleForward0100.checked
    ⟨i.val, by rw [size0100]; exact i.isLt⟩
  change (entry0100 i).check = true at h
  rcases fields0100 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0101 : OriginalRow227TriangleForward0101.entries.size = 32 := rfl

def entry0101 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0101.entries[i.val]'(by rw [size0101]; exact i.isLt)

theorem fields0101 (i : Fin 32) :
    (entry0101 i).IA = shift ∧ (entry0101 i).ID = S (166 + i.val + 1) ∧
      (entry0101 i).IC = S 7 ∧ (entry0101 i).Inext = T 6 (166 + i.val + 1) ∧
      (entry0101 i).Icur = T 6 (166 + i.val) ∧
      (entry0101 i).output = T 7 (166 + i.val) ∧
      (entry0101 i).charge = charge 6 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0101_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0101 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 7) (T 6 (166 + i.val + 1))
      (T 6 (166 + i.val)) (T 7 (166 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0101.entries OriginalRow227TriangleForward0101.checked
    ⟨i.val, by rw [size0101]; exact i.isLt⟩
  change (entry0101 i).check = true at h
  rcases fields0101 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0102 : OriginalRow227TriangleForward0102.entries.size = 32 := rfl

def entry0102 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0102.entries[i.val]'(by rw [size0102]; exact i.isLt)

theorem fields0102 (i : Fin 32) :
    (entry0102 i).IA = shift ∧ (entry0102 i).ID = S (198 + i.val + 1) ∧
      (entry0102 i).IC = S 7 ∧ (entry0102 i).Inext = T 6 (198 + i.val + 1) ∧
      (entry0102 i).Icur = T 6 (198 + i.val) ∧
      (entry0102 i).output = T 7 (198 + i.val) ∧
      (entry0102 i).charge = charge 6 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0102_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0102 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 7) (T 6 (198 + i.val + 1))
      (T 6 (198 + i.val)) (T 7 (198 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0102.entries OriginalRow227TriangleForward0102.checked
    ⟨i.val, by rw [size0102]; exact i.isLt⟩
  change (entry0102 i).check = true at h
  rcases fields0102 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0103 : OriginalRow227TriangleForward0103.entries.size = 32 := rfl

def entry0103 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0103.entries[i.val]'(by rw [size0103]; exact i.isLt)

theorem fields0103 (i : Fin 32) :
    (entry0103 i).IA = shift ∧ (entry0103 i).ID = S (230 + i.val + 1) ∧
      (entry0103 i).IC = S 7 ∧ (entry0103 i).Inext = T 6 (230 + i.val + 1) ∧
      (entry0103 i).Icur = T 6 (230 + i.val) ∧
      (entry0103 i).output = T 7 (230 + i.val) ∧
      (entry0103 i).charge = charge 6 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0103_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0103 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 7) (T 6 (230 + i.val + 1))
      (T 6 (230 + i.val)) (T 7 (230 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0103.entries OriginalRow227TriangleForward0103.checked
    ⟨i.val, by rw [size0103]; exact i.isLt⟩
  change (entry0103 i).check = true at h
  rcases fields0103 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0104 : OriginalRow227TriangleForward0104.entries.size = 32 := rfl

def entry0104 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0104.entries[i.val]'(by rw [size0104]; exact i.isLt)

theorem fields0104 (i : Fin 32) :
    (entry0104 i).IA = shift ∧ (entry0104 i).ID = S (262 + i.val + 1) ∧
      (entry0104 i).IC = S 7 ∧ (entry0104 i).Inext = T 6 (262 + i.val + 1) ∧
      (entry0104 i).Icur = T 6 (262 + i.val) ∧
      (entry0104 i).output = T 7 (262 + i.val) ∧
      (entry0104 i).charge = charge 6 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0104_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0104 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 7) (T 6 (262 + i.val + 1))
      (T 6 (262 + i.val)) (T 7 (262 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0104.entries OriginalRow227TriangleForward0104.checked
    ⟨i.val, by rw [size0104]; exact i.isLt⟩
  change (entry0104 i).check = true at h
  rcases fields0104 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0105 : OriginalRow227TriangleForward0105.entries.size = 32 := rfl

def entry0105 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0105.entries[i.val]'(by rw [size0105]; exact i.isLt)

theorem fields0105 (i : Fin 32) :
    (entry0105 i).IA = shift ∧ (entry0105 i).ID = S (294 + i.val + 1) ∧
      (entry0105 i).IC = S 7 ∧ (entry0105 i).Inext = T 6 (294 + i.val + 1) ∧
      (entry0105 i).Icur = T 6 (294 + i.val) ∧
      (entry0105 i).output = T 7 (294 + i.val) ∧
      (entry0105 i).charge = charge 6 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0105_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0105 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 7) (T 6 (294 + i.val + 1))
      (T 6 (294 + i.val)) (T 7 (294 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0105.entries OriginalRow227TriangleForward0105.checked
    ⟨i.val, by rw [size0105]; exact i.isLt⟩
  change (entry0105 i).check = true at h
  rcases fields0105 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0106 : OriginalRow227TriangleForward0106.entries.size = 32 := rfl

def entry0106 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0106.entries[i.val]'(by rw [size0106]; exact i.isLt)

theorem fields0106 (i : Fin 32) :
    (entry0106 i).IA = shift ∧ (entry0106 i).ID = S (326 + i.val + 1) ∧
      (entry0106 i).IC = S 7 ∧ (entry0106 i).Inext = T 6 (326 + i.val + 1) ∧
      (entry0106 i).Icur = T 6 (326 + i.val) ∧
      (entry0106 i).output = T 7 (326 + i.val) ∧
      (entry0106 i).charge = charge 6 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0106_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0106 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 7) (T 6 (326 + i.val + 1))
      (T 6 (326 + i.val)) (T 7 (326 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0106.entries OriginalRow227TriangleForward0106.checked
    ⟨i.val, by rw [size0106]; exact i.isLt⟩
  change (entry0106 i).check = true at h
  rcases fields0106 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0107 : OriginalRow227TriangleForward0107.entries.size = 32 := rfl

def entry0107 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0107.entries[i.val]'(by rw [size0107]; exact i.isLt)

theorem fields0107 (i : Fin 32) :
    (entry0107 i).IA = shift ∧ (entry0107 i).ID = S (358 + i.val + 1) ∧
      (entry0107 i).IC = S 7 ∧ (entry0107 i).Inext = T 6 (358 + i.val + 1) ∧
      (entry0107 i).Icur = T 6 (358 + i.val) ∧
      (entry0107 i).output = T 7 (358 + i.val) ∧
      (entry0107 i).charge = charge 6 (358 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0107_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0107 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (358 + i.val)) shift
      (S (358 + i.val + 1)) (S 7) (T 6 (358 + i.val + 1))
      (T 6 (358 + i.val)) (T 7 (358 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0107.entries OriginalRow227TriangleForward0107.checked
    ⟨i.val, by rw [size0107]; exact i.isLt⟩
  change (entry0107 i).check = true at h
  rcases fields0107 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0108 : OriginalRow227TriangleForward0108.entries.size = 32 := rfl

def entry0108 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0108.entries[i.val]'(by rw [size0108]; exact i.isLt)

theorem fields0108 (i : Fin 32) :
    (entry0108 i).IA = shift ∧ (entry0108 i).ID = S (390 + i.val + 1) ∧
      (entry0108 i).IC = S 7 ∧ (entry0108 i).Inext = T 6 (390 + i.val + 1) ∧
      (entry0108 i).Icur = T 6 (390 + i.val) ∧
      (entry0108 i).output = T 7 (390 + i.val) ∧
      (entry0108 i).charge = charge 6 (390 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0108_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0108 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (390 + i.val)) shift
      (S (390 + i.val + 1)) (S 7) (T 6 (390 + i.val + 1))
      (T 6 (390 + i.val)) (T 7 (390 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0108.entries OriginalRow227TriangleForward0108.checked
    ⟨i.val, by rw [size0108]; exact i.isLt⟩
  change (entry0108 i).check = true at h
  rcases fields0108 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0109 : OriginalRow227TriangleForward0109.entries.size = 32 := rfl

def entry0109 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0109.entries[i.val]'(by rw [size0109]; exact i.isLt)

theorem fields0109 (i : Fin 32) :
    (entry0109 i).IA = shift ∧ (entry0109 i).ID = S (422 + i.val + 1) ∧
      (entry0109 i).IC = S 7 ∧ (entry0109 i).Inext = T 6 (422 + i.val + 1) ∧
      (entry0109 i).Icur = T 6 (422 + i.val) ∧
      (entry0109 i).output = T 7 (422 + i.val) ∧
      (entry0109 i).charge = charge 6 (422 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0109_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0109 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (422 + i.val)) shift
      (S (422 + i.val + 1)) (S 7) (T 6 (422 + i.val + 1))
      (T 6 (422 + i.val)) (T 7 (422 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0109.entries OriginalRow227TriangleForward0109.checked
    ⟨i.val, by rw [size0109]; exact i.isLt⟩
  change (entry0109 i).check = true at h
  rcases fields0109 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0110 : OriginalRow227TriangleForward0110.entries.size = 32 := rfl

def entry0110 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0110.entries[i.val]'(by rw [size0110]; exact i.isLt)

theorem fields0110 (i : Fin 32) :
    (entry0110 i).IA = shift ∧ (entry0110 i).ID = S (454 + i.val + 1) ∧
      (entry0110 i).IC = S 7 ∧ (entry0110 i).Inext = T 6 (454 + i.val + 1) ∧
      (entry0110 i).Icur = T 6 (454 + i.val) ∧
      (entry0110 i).output = T 7 (454 + i.val) ∧
      (entry0110 i).charge = charge 6 (454 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0110_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0110 (i : Fin 32) :
    forwardStepOK (-768) (charge 6 (454 + i.val)) shift
      (S (454 + i.val + 1)) (S 7) (T 6 (454 + i.val + 1))
      (T 6 (454 + i.val)) (T 7 (454 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0110.entries OriginalRow227TriangleForward0110.checked
    ⟨i.val, by rw [size0110]; exact i.isLt⟩
  change (entry0110 i).check = true at h
  rcases fields0110 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0111 : OriginalRow227TriangleForward0111.entries.size = 9 := rfl

def entry0111 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0111.entries[i.val]'(by rw [size0111]; exact i.isLt)

theorem fields0111 (i : Fin 9) :
    (entry0111 i).IA = shift ∧ (entry0111 i).ID = S (486 + i.val + 1) ∧
      (entry0111 i).IC = S 7 ∧ (entry0111 i).Inext = T 6 (486 + i.val + 1) ∧
      (entry0111 i).Icur = T 6 (486 + i.val) ∧
      (entry0111 i).output = T 7 (486 + i.val) ∧
      (entry0111 i).charge = charge 6 (486 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow006.block0111_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨8, by decide⟩).symm, rfl⟩

theorem step0111 (i : Fin 9) :
    forwardStepOK (-768) (charge 6 (486 + i.val)) shift
      (S (486 + i.val + 1)) (S 7) (T 6 (486 + i.val + 1))
      (T 6 (486 + i.val)) (T 7 (486 + i.val))
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0111.entries OriginalRow227TriangleForward0111.checked
    ⟨i.val, by rw [size0111]; exact i.isLt⟩
  change (entry0111 i).check = true at h
  rcases fields0111 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 6 ≤ d) (hhi : d < 495) :
    forwardStepOK (-768) (charge 6 d) shift (S (d + 1)) (S 7)
      (T 6 (d + 1)) (T 6 d) (T 7 d)
      (OriginalRow227Roots.root_pos 7 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 6 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h134 : d < 134
    ·
      by_cases h70 : d < 70
      ·
        by_cases h38 : d < 38
        ·
          have hi : d - 6 < 32 := by omega
          have heq : 6 + (d - 6) = d := by omega
          simpa only [heq] using step0096 ⟨d - 6, hi⟩
        ·
          have hi : d - 38 < 32 := by omega
          have heq : 38 + (d - 38) = d := by omega
          simpa only [heq] using step0097 ⟨d - 38, hi⟩
      ·
        by_cases h102 : d < 102
        ·
          have hi : d - 70 < 32 := by omega
          have heq : 70 + (d - 70) = d := by omega
          simpa only [heq] using step0098 ⟨d - 70, hi⟩
        ·
          have hi : d - 102 < 32 := by omega
          have heq : 102 + (d - 102) = d := by omega
          simpa only [heq] using step0099 ⟨d - 102, hi⟩
    ·
      by_cases h198 : d < 198
      ·
        by_cases h166 : d < 166
        ·
          have hi : d - 134 < 32 := by omega
          have heq : 134 + (d - 134) = d := by omega
          simpa only [heq] using step0100 ⟨d - 134, hi⟩
        ·
          have hi : d - 166 < 32 := by omega
          have heq : 166 + (d - 166) = d := by omega
          simpa only [heq] using step0101 ⟨d - 166, hi⟩
      ·
        by_cases h230 : d < 230
        ·
          have hi : d - 198 < 32 := by omega
          have heq : 198 + (d - 198) = d := by omega
          simpa only [heq] using step0102 ⟨d - 198, hi⟩
        ·
          have hi : d - 230 < 32 := by omega
          have heq : 230 + (d - 230) = d := by omega
          simpa only [heq] using step0103 ⟨d - 230, hi⟩
  ·
    by_cases h390 : d < 390
    ·
      by_cases h326 : d < 326
      ·
        by_cases h294 : d < 294
        ·
          have hi : d - 262 < 32 := by omega
          have heq : 262 + (d - 262) = d := by omega
          simpa only [heq] using step0104 ⟨d - 262, hi⟩
        ·
          have hi : d - 294 < 32 := by omega
          have heq : 294 + (d - 294) = d := by omega
          simpa only [heq] using step0105 ⟨d - 294, hi⟩
      ·
        by_cases h358 : d < 358
        ·
          have hi : d - 326 < 32 := by omega
          have heq : 326 + (d - 326) = d := by omega
          simpa only [heq] using step0106 ⟨d - 326, hi⟩
        ·
          have hi : d - 358 < 32 := by omega
          have heq : 358 + (d - 358) = d := by omega
          simpa only [heq] using step0107 ⟨d - 358, hi⟩
    ·
      by_cases h454 : d < 454
      ·
        by_cases h422 : d < 422
        ·
          have hi : d - 390 < 32 := by omega
          have heq : 390 + (d - 390) = d := by omega
          simpa only [heq] using step0108 ⟨d - 390, hi⟩
        ·
          have hi : d - 422 < 32 := by omega
          have heq : 422 + (d - 422) = d := by omega
          simpa only [heq] using step0109 ⟨d - 422, hi⟩
      ·
        by_cases h486 : d < 486
        ·
          have hi : d - 454 < 32 := by omega
          have heq : 454 + (d - 454) = d := by omega
          simpa only [heq] using step0110 ⟨d - 454, hi⟩
        ·
          have hi : d - 486 < 9 := by omega
          have heq : 486 + (d - 486) = d := by omega
          simpa only [heq] using step0111 ⟨d - 486, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0096,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0096,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0097,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0097,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0098,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0098,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0099,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0099,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0100,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0100,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0101,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0101,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0102,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0102,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0103,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0103,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0104,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0104,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0105,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0105,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0106,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0106,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0107,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0107,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0108,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0108,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0109,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0109,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0110,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0110,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.fields0111,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.step0111,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow007
