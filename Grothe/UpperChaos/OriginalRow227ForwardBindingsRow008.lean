import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008
import Grothe.UpperChaos.OriginalRow227TriangleForward0112
import Grothe.UpperChaos.OriginalRow227TriangleForward0113
import Grothe.UpperChaos.OriginalRow227TriangleForward0114
import Grothe.UpperChaos.OriginalRow227TriangleForward0115
import Grothe.UpperChaos.OriginalRow227TriangleForward0116
import Grothe.UpperChaos.OriginalRow227TriangleForward0117
import Grothe.UpperChaos.OriginalRow227TriangleForward0118
import Grothe.UpperChaos.OriginalRow227TriangleForward0119
import Grothe.UpperChaos.OriginalRow227TriangleForward0120
import Grothe.UpperChaos.OriginalRow227TriangleForward0121
import Grothe.UpperChaos.OriginalRow227TriangleForward0122
import Grothe.UpperChaos.OriginalRow227TriangleForward0123
import Grothe.UpperChaos.OriginalRow227TriangleForward0124
import Grothe.UpperChaos.OriginalRow227TriangleForward0125
import Grothe.UpperChaos.OriginalRow227TriangleForward0126
import Grothe.UpperChaos.OriginalRow227TriangleForward0127

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0112 : OriginalRow227TriangleForward0112.entries.size = 32 := rfl

def entry0112 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0112.entries[i.val]'(by rw [size0112]; exact i.isLt)

theorem fields0112 (i : Fin 32) :
    (entry0112 i).IA = shift ∧ (entry0112 i).ID = S (7 + i.val + 1) ∧
      (entry0112 i).IC = S 8 ∧ (entry0112 i).Inext = T 7 (7 + i.val + 1) ∧
      (entry0112 i).Icur = T 7 (7 + i.val) ∧
      (entry0112 i).output = T 8 (7 + i.val) ∧
      (entry0112 i).charge = charge 7 (7 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0112_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0112 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (7 + i.val)) shift
      (S (7 + i.val + 1)) (S 8) (T 7 (7 + i.val + 1))
      (T 7 (7 + i.val)) (T 8 (7 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0112.entries OriginalRow227TriangleForward0112.checked
    ⟨i.val, by rw [size0112]; exact i.isLt⟩
  change (entry0112 i).check = true at h
  rcases fields0112 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0113 : OriginalRow227TriangleForward0113.entries.size = 32 := rfl

def entry0113 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0113.entries[i.val]'(by rw [size0113]; exact i.isLt)

theorem fields0113 (i : Fin 32) :
    (entry0113 i).IA = shift ∧ (entry0113 i).ID = S (39 + i.val + 1) ∧
      (entry0113 i).IC = S 8 ∧ (entry0113 i).Inext = T 7 (39 + i.val + 1) ∧
      (entry0113 i).Icur = T 7 (39 + i.val) ∧
      (entry0113 i).output = T 8 (39 + i.val) ∧
      (entry0113 i).charge = charge 7 (39 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0113_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0113 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (39 + i.val)) shift
      (S (39 + i.val + 1)) (S 8) (T 7 (39 + i.val + 1))
      (T 7 (39 + i.val)) (T 8 (39 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0113.entries OriginalRow227TriangleForward0113.checked
    ⟨i.val, by rw [size0113]; exact i.isLt⟩
  change (entry0113 i).check = true at h
  rcases fields0113 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0114 : OriginalRow227TriangleForward0114.entries.size = 32 := rfl

def entry0114 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0114.entries[i.val]'(by rw [size0114]; exact i.isLt)

theorem fields0114 (i : Fin 32) :
    (entry0114 i).IA = shift ∧ (entry0114 i).ID = S (71 + i.val + 1) ∧
      (entry0114 i).IC = S 8 ∧ (entry0114 i).Inext = T 7 (71 + i.val + 1) ∧
      (entry0114 i).Icur = T 7 (71 + i.val) ∧
      (entry0114 i).output = T 8 (71 + i.val) ∧
      (entry0114 i).charge = charge 7 (71 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0114_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0114 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (71 + i.val)) shift
      (S (71 + i.val + 1)) (S 8) (T 7 (71 + i.val + 1))
      (T 7 (71 + i.val)) (T 8 (71 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0114.entries OriginalRow227TriangleForward0114.checked
    ⟨i.val, by rw [size0114]; exact i.isLt⟩
  change (entry0114 i).check = true at h
  rcases fields0114 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0115 : OriginalRow227TriangleForward0115.entries.size = 32 := rfl

def entry0115 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0115.entries[i.val]'(by rw [size0115]; exact i.isLt)

theorem fields0115 (i : Fin 32) :
    (entry0115 i).IA = shift ∧ (entry0115 i).ID = S (103 + i.val + 1) ∧
      (entry0115 i).IC = S 8 ∧ (entry0115 i).Inext = T 7 (103 + i.val + 1) ∧
      (entry0115 i).Icur = T 7 (103 + i.val) ∧
      (entry0115 i).output = T 8 (103 + i.val) ∧
      (entry0115 i).charge = charge 7 (103 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0115_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0115 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (103 + i.val)) shift
      (S (103 + i.val + 1)) (S 8) (T 7 (103 + i.val + 1))
      (T 7 (103 + i.val)) (T 8 (103 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0115.entries OriginalRow227TriangleForward0115.checked
    ⟨i.val, by rw [size0115]; exact i.isLt⟩
  change (entry0115 i).check = true at h
  rcases fields0115 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0116 : OriginalRow227TriangleForward0116.entries.size = 32 := rfl

def entry0116 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0116.entries[i.val]'(by rw [size0116]; exact i.isLt)

theorem fields0116 (i : Fin 32) :
    (entry0116 i).IA = shift ∧ (entry0116 i).ID = S (135 + i.val + 1) ∧
      (entry0116 i).IC = S 8 ∧ (entry0116 i).Inext = T 7 (135 + i.val + 1) ∧
      (entry0116 i).Icur = T 7 (135 + i.val) ∧
      (entry0116 i).output = T 8 (135 + i.val) ∧
      (entry0116 i).charge = charge 7 (135 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0116_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0116 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (135 + i.val)) shift
      (S (135 + i.val + 1)) (S 8) (T 7 (135 + i.val + 1))
      (T 7 (135 + i.val)) (T 8 (135 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0116.entries OriginalRow227TriangleForward0116.checked
    ⟨i.val, by rw [size0116]; exact i.isLt⟩
  change (entry0116 i).check = true at h
  rcases fields0116 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0117 : OriginalRow227TriangleForward0117.entries.size = 32 := rfl

def entry0117 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0117.entries[i.val]'(by rw [size0117]; exact i.isLt)

theorem fields0117 (i : Fin 32) :
    (entry0117 i).IA = shift ∧ (entry0117 i).ID = S (167 + i.val + 1) ∧
      (entry0117 i).IC = S 8 ∧ (entry0117 i).Inext = T 7 (167 + i.val + 1) ∧
      (entry0117 i).Icur = T 7 (167 + i.val) ∧
      (entry0117 i).output = T 8 (167 + i.val) ∧
      (entry0117 i).charge = charge 7 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0117_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0117 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 8) (T 7 (167 + i.val + 1))
      (T 7 (167 + i.val)) (T 8 (167 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0117.entries OriginalRow227TriangleForward0117.checked
    ⟨i.val, by rw [size0117]; exact i.isLt⟩
  change (entry0117 i).check = true at h
  rcases fields0117 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0118 : OriginalRow227TriangleForward0118.entries.size = 32 := rfl

def entry0118 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0118.entries[i.val]'(by rw [size0118]; exact i.isLt)

theorem fields0118 (i : Fin 32) :
    (entry0118 i).IA = shift ∧ (entry0118 i).ID = S (199 + i.val + 1) ∧
      (entry0118 i).IC = S 8 ∧ (entry0118 i).Inext = T 7 (199 + i.val + 1) ∧
      (entry0118 i).Icur = T 7 (199 + i.val) ∧
      (entry0118 i).output = T 8 (199 + i.val) ∧
      (entry0118 i).charge = charge 7 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0118_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0118 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 8) (T 7 (199 + i.val + 1))
      (T 7 (199 + i.val)) (T 8 (199 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0118.entries OriginalRow227TriangleForward0118.checked
    ⟨i.val, by rw [size0118]; exact i.isLt⟩
  change (entry0118 i).check = true at h
  rcases fields0118 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0119 : OriginalRow227TriangleForward0119.entries.size = 32 := rfl

def entry0119 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0119.entries[i.val]'(by rw [size0119]; exact i.isLt)

theorem fields0119 (i : Fin 32) :
    (entry0119 i).IA = shift ∧ (entry0119 i).ID = S (231 + i.val + 1) ∧
      (entry0119 i).IC = S 8 ∧ (entry0119 i).Inext = T 7 (231 + i.val + 1) ∧
      (entry0119 i).Icur = T 7 (231 + i.val) ∧
      (entry0119 i).output = T 8 (231 + i.val) ∧
      (entry0119 i).charge = charge 7 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0119_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0119 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 8) (T 7 (231 + i.val + 1))
      (T 7 (231 + i.val)) (T 8 (231 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0119.entries OriginalRow227TriangleForward0119.checked
    ⟨i.val, by rw [size0119]; exact i.isLt⟩
  change (entry0119 i).check = true at h
  rcases fields0119 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0120 : OriginalRow227TriangleForward0120.entries.size = 32 := rfl

def entry0120 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0120.entries[i.val]'(by rw [size0120]; exact i.isLt)

theorem fields0120 (i : Fin 32) :
    (entry0120 i).IA = shift ∧ (entry0120 i).ID = S (263 + i.val + 1) ∧
      (entry0120 i).IC = S 8 ∧ (entry0120 i).Inext = T 7 (263 + i.val + 1) ∧
      (entry0120 i).Icur = T 7 (263 + i.val) ∧
      (entry0120 i).output = T 8 (263 + i.val) ∧
      (entry0120 i).charge = charge 7 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0120_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0120 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 8) (T 7 (263 + i.val + 1))
      (T 7 (263 + i.val)) (T 8 (263 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0120.entries OriginalRow227TriangleForward0120.checked
    ⟨i.val, by rw [size0120]; exact i.isLt⟩
  change (entry0120 i).check = true at h
  rcases fields0120 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0121 : OriginalRow227TriangleForward0121.entries.size = 32 := rfl

def entry0121 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0121.entries[i.val]'(by rw [size0121]; exact i.isLt)

theorem fields0121 (i : Fin 32) :
    (entry0121 i).IA = shift ∧ (entry0121 i).ID = S (295 + i.val + 1) ∧
      (entry0121 i).IC = S 8 ∧ (entry0121 i).Inext = T 7 (295 + i.val + 1) ∧
      (entry0121 i).Icur = T 7 (295 + i.val) ∧
      (entry0121 i).output = T 8 (295 + i.val) ∧
      (entry0121 i).charge = charge 7 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0121_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0121 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 8) (T 7 (295 + i.val + 1))
      (T 7 (295 + i.val)) (T 8 (295 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0121.entries OriginalRow227TriangleForward0121.checked
    ⟨i.val, by rw [size0121]; exact i.isLt⟩
  change (entry0121 i).check = true at h
  rcases fields0121 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0122 : OriginalRow227TriangleForward0122.entries.size = 32 := rfl

def entry0122 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0122.entries[i.val]'(by rw [size0122]; exact i.isLt)

theorem fields0122 (i : Fin 32) :
    (entry0122 i).IA = shift ∧ (entry0122 i).ID = S (327 + i.val + 1) ∧
      (entry0122 i).IC = S 8 ∧ (entry0122 i).Inext = T 7 (327 + i.val + 1) ∧
      (entry0122 i).Icur = T 7 (327 + i.val) ∧
      (entry0122 i).output = T 8 (327 + i.val) ∧
      (entry0122 i).charge = charge 7 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0122_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0122 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 8) (T 7 (327 + i.val + 1))
      (T 7 (327 + i.val)) (T 8 (327 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0122.entries OriginalRow227TriangleForward0122.checked
    ⟨i.val, by rw [size0122]; exact i.isLt⟩
  change (entry0122 i).check = true at h
  rcases fields0122 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0123 : OriginalRow227TriangleForward0123.entries.size = 32 := rfl

def entry0123 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0123.entries[i.val]'(by rw [size0123]; exact i.isLt)

theorem fields0123 (i : Fin 32) :
    (entry0123 i).IA = shift ∧ (entry0123 i).ID = S (359 + i.val + 1) ∧
      (entry0123 i).IC = S 8 ∧ (entry0123 i).Inext = T 7 (359 + i.val + 1) ∧
      (entry0123 i).Icur = T 7 (359 + i.val) ∧
      (entry0123 i).output = T 8 (359 + i.val) ∧
      (entry0123 i).charge = charge 7 (359 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0123_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0123 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (359 + i.val)) shift
      (S (359 + i.val + 1)) (S 8) (T 7 (359 + i.val + 1))
      (T 7 (359 + i.val)) (T 8 (359 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0123.entries OriginalRow227TriangleForward0123.checked
    ⟨i.val, by rw [size0123]; exact i.isLt⟩
  change (entry0123 i).check = true at h
  rcases fields0123 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0124 : OriginalRow227TriangleForward0124.entries.size = 32 := rfl

def entry0124 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0124.entries[i.val]'(by rw [size0124]; exact i.isLt)

theorem fields0124 (i : Fin 32) :
    (entry0124 i).IA = shift ∧ (entry0124 i).ID = S (391 + i.val + 1) ∧
      (entry0124 i).IC = S 8 ∧ (entry0124 i).Inext = T 7 (391 + i.val + 1) ∧
      (entry0124 i).Icur = T 7 (391 + i.val) ∧
      (entry0124 i).output = T 8 (391 + i.val) ∧
      (entry0124 i).charge = charge 7 (391 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0124_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0124 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (391 + i.val)) shift
      (S (391 + i.val + 1)) (S 8) (T 7 (391 + i.val + 1))
      (T 7 (391 + i.val)) (T 8 (391 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0124.entries OriginalRow227TriangleForward0124.checked
    ⟨i.val, by rw [size0124]; exact i.isLt⟩
  change (entry0124 i).check = true at h
  rcases fields0124 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0125 : OriginalRow227TriangleForward0125.entries.size = 32 := rfl

def entry0125 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0125.entries[i.val]'(by rw [size0125]; exact i.isLt)

theorem fields0125 (i : Fin 32) :
    (entry0125 i).IA = shift ∧ (entry0125 i).ID = S (423 + i.val + 1) ∧
      (entry0125 i).IC = S 8 ∧ (entry0125 i).Inext = T 7 (423 + i.val + 1) ∧
      (entry0125 i).Icur = T 7 (423 + i.val) ∧
      (entry0125 i).output = T 8 (423 + i.val) ∧
      (entry0125 i).charge = charge 7 (423 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0125_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0125 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (423 + i.val)) shift
      (S (423 + i.val + 1)) (S 8) (T 7 (423 + i.val + 1))
      (T 7 (423 + i.val)) (T 8 (423 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0125.entries OriginalRow227TriangleForward0125.checked
    ⟨i.val, by rw [size0125]; exact i.isLt⟩
  change (entry0125 i).check = true at h
  rcases fields0125 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0126 : OriginalRow227TriangleForward0126.entries.size = 32 := rfl

def entry0126 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0126.entries[i.val]'(by rw [size0126]; exact i.isLt)

theorem fields0126 (i : Fin 32) :
    (entry0126 i).IA = shift ∧ (entry0126 i).ID = S (455 + i.val + 1) ∧
      (entry0126 i).IC = S 8 ∧ (entry0126 i).Inext = T 7 (455 + i.val + 1) ∧
      (entry0126 i).Icur = T 7 (455 + i.val) ∧
      (entry0126 i).output = T 8 (455 + i.val) ∧
      (entry0126 i).charge = charge 7 (455 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0126_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0126 (i : Fin 32) :
    forwardStepOK (-768) (charge 7 (455 + i.val)) shift
      (S (455 + i.val + 1)) (S 8) (T 7 (455 + i.val + 1))
      (T 7 (455 + i.val)) (T 8 (455 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0126.entries OriginalRow227TriangleForward0126.checked
    ⟨i.val, by rw [size0126]; exact i.isLt⟩
  change (entry0126 i).check = true at h
  rcases fields0126 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0127 : OriginalRow227TriangleForward0127.entries.size = 7 := rfl

def entry0127 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0127.entries[i.val]'(by rw [size0127]; exact i.isLt)

theorem fields0127 (i : Fin 7) :
    (entry0127 i).IA = shift ∧ (entry0127 i).ID = S (487 + i.val + 1) ∧
      (entry0127 i).IC = S 8 ∧ (entry0127 i).Inext = T 7 (487 + i.val + 1) ∧
      (entry0127 i).Icur = T 7 (487 + i.val) ∧
      (entry0127 i).output = T 8 (487 + i.val) ∧
      (entry0127 i).charge = charge 7 (487 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow007.block0127_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨6, by decide⟩).symm, rfl⟩

theorem step0127 (i : Fin 7) :
    forwardStepOK (-768) (charge 7 (487 + i.val)) shift
      (S (487 + i.val + 1)) (S 8) (T 7 (487 + i.val + 1))
      (T 7 (487 + i.val)) (T 8 (487 + i.val))
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0127.entries OriginalRow227TriangleForward0127.checked
    ⟨i.val, by rw [size0127]; exact i.isLt⟩
  change (entry0127 i).check = true at h
  rcases fields0127 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 7 ≤ d) (hhi : d < 494) :
    forwardStepOK (-768) (charge 7 d) shift (S (d + 1)) (S 8)
      (T 7 (d + 1)) (T 7 d) (T 8 d)
      (OriginalRow227Roots.root_pos 8 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 7 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h135 : d < 135
    ·
      by_cases h71 : d < 71
      ·
        by_cases h39 : d < 39
        ·
          have hi : d - 7 < 32 := by omega
          have heq : 7 + (d - 7) = d := by omega
          simpa only [heq] using step0112 ⟨d - 7, hi⟩
        ·
          have hi : d - 39 < 32 := by omega
          have heq : 39 + (d - 39) = d := by omega
          simpa only [heq] using step0113 ⟨d - 39, hi⟩
      ·
        by_cases h103 : d < 103
        ·
          have hi : d - 71 < 32 := by omega
          have heq : 71 + (d - 71) = d := by omega
          simpa only [heq] using step0114 ⟨d - 71, hi⟩
        ·
          have hi : d - 103 < 32 := by omega
          have heq : 103 + (d - 103) = d := by omega
          simpa only [heq] using step0115 ⟨d - 103, hi⟩
    ·
      by_cases h199 : d < 199
      ·
        by_cases h167 : d < 167
        ·
          have hi : d - 135 < 32 := by omega
          have heq : 135 + (d - 135) = d := by omega
          simpa only [heq] using step0116 ⟨d - 135, hi⟩
        ·
          have hi : d - 167 < 32 := by omega
          have heq : 167 + (d - 167) = d := by omega
          simpa only [heq] using step0117 ⟨d - 167, hi⟩
      ·
        by_cases h231 : d < 231
        ·
          have hi : d - 199 < 32 := by omega
          have heq : 199 + (d - 199) = d := by omega
          simpa only [heq] using step0118 ⟨d - 199, hi⟩
        ·
          have hi : d - 231 < 32 := by omega
          have heq : 231 + (d - 231) = d := by omega
          simpa only [heq] using step0119 ⟨d - 231, hi⟩
  ·
    by_cases h391 : d < 391
    ·
      by_cases h327 : d < 327
      ·
        by_cases h295 : d < 295
        ·
          have hi : d - 263 < 32 := by omega
          have heq : 263 + (d - 263) = d := by omega
          simpa only [heq] using step0120 ⟨d - 263, hi⟩
        ·
          have hi : d - 295 < 32 := by omega
          have heq : 295 + (d - 295) = d := by omega
          simpa only [heq] using step0121 ⟨d - 295, hi⟩
      ·
        by_cases h359 : d < 359
        ·
          have hi : d - 327 < 32 := by omega
          have heq : 327 + (d - 327) = d := by omega
          simpa only [heq] using step0122 ⟨d - 327, hi⟩
        ·
          have hi : d - 359 < 32 := by omega
          have heq : 359 + (d - 359) = d := by omega
          simpa only [heq] using step0123 ⟨d - 359, hi⟩
    ·
      by_cases h455 : d < 455
      ·
        by_cases h423 : d < 423
        ·
          have hi : d - 391 < 32 := by omega
          have heq : 391 + (d - 391) = d := by omega
          simpa only [heq] using step0124 ⟨d - 391, hi⟩
        ·
          have hi : d - 423 < 32 := by omega
          have heq : 423 + (d - 423) = d := by omega
          simpa only [heq] using step0125 ⟨d - 423, hi⟩
      ·
        by_cases h487 : d < 487
        ·
          have hi : d - 455 < 32 := by omega
          have heq : 455 + (d - 455) = d := by omega
          simpa only [heq] using step0126 ⟨d - 455, hi⟩
        ·
          have hi : d - 487 < 7 := by omega
          have heq : 487 + (d - 487) = d := by omega
          simpa only [heq] using step0127 ⟨d - 487, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0112,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0112,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0113,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0113,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0114,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0114,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0115,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0115,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0116,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0116,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0117,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0117,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0118,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0118,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0119,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0119,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0120,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0120,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0121,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0121,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0122,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0122,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0123,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0123,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0124,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0124,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0125,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0125,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0126,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0126,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.fields0127,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.step0127,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow008
