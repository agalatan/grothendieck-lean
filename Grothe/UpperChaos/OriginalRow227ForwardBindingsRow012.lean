import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012
import Grothe.UpperChaos.OriginalRow227TriangleForward0176
import Grothe.UpperChaos.OriginalRow227TriangleForward0177
import Grothe.UpperChaos.OriginalRow227TriangleForward0178
import Grothe.UpperChaos.OriginalRow227TriangleForward0179
import Grothe.UpperChaos.OriginalRow227TriangleForward0180
import Grothe.UpperChaos.OriginalRow227TriangleForward0181
import Grothe.UpperChaos.OriginalRow227TriangleForward0182
import Grothe.UpperChaos.OriginalRow227TriangleForward0183
import Grothe.UpperChaos.OriginalRow227TriangleForward0184
import Grothe.UpperChaos.OriginalRow227TriangleForward0185
import Grothe.UpperChaos.OriginalRow227TriangleForward0186
import Grothe.UpperChaos.OriginalRow227TriangleForward0187
import Grothe.UpperChaos.OriginalRow227TriangleForward0188
import Grothe.UpperChaos.OriginalRow227TriangleForward0189
import Grothe.UpperChaos.OriginalRow227TriangleForward0190

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0176 : OriginalRow227TriangleForward0176.entries.size = 32 := rfl

def entry0176 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0176.entries[i.val]'(by rw [size0176]; exact i.isLt)

theorem fields0176 (i : Fin 32) :
    (entry0176 i).IA = shift ∧ (entry0176 i).ID = S (11 + i.val + 1) ∧
      (entry0176 i).IC = S 12 ∧ (entry0176 i).Inext = T 11 (11 + i.val + 1) ∧
      (entry0176 i).Icur = T 11 (11 + i.val) ∧
      (entry0176 i).output = T 12 (11 + i.val) ∧
      (entry0176 i).charge = charge 11 (11 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0192_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0176 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (11 + i.val)) shift
      (S (11 + i.val + 1)) (S 12) (T 11 (11 + i.val + 1))
      (T 11 (11 + i.val)) (T 12 (11 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0176.entries OriginalRow227TriangleForward0176.checked
    ⟨i.val, by rw [size0176]; exact i.isLt⟩
  change (entry0176 i).check = true at h
  rcases fields0176 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0177 : OriginalRow227TriangleForward0177.entries.size = 32 := rfl

def entry0177 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0177.entries[i.val]'(by rw [size0177]; exact i.isLt)

theorem fields0177 (i : Fin 32) :
    (entry0177 i).IA = shift ∧ (entry0177 i).ID = S (43 + i.val + 1) ∧
      (entry0177 i).IC = S 12 ∧ (entry0177 i).Inext = T 11 (43 + i.val + 1) ∧
      (entry0177 i).Icur = T 11 (43 + i.val) ∧
      (entry0177 i).output = T 12 (43 + i.val) ∧
      (entry0177 i).charge = charge 11 (43 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0193_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0177 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (43 + i.val)) shift
      (S (43 + i.val + 1)) (S 12) (T 11 (43 + i.val + 1))
      (T 11 (43 + i.val)) (T 12 (43 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0177.entries OriginalRow227TriangleForward0177.checked
    ⟨i.val, by rw [size0177]; exact i.isLt⟩
  change (entry0177 i).check = true at h
  rcases fields0177 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0178 : OriginalRow227TriangleForward0178.entries.size = 32 := rfl

def entry0178 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0178.entries[i.val]'(by rw [size0178]; exact i.isLt)

theorem fields0178 (i : Fin 32) :
    (entry0178 i).IA = shift ∧ (entry0178 i).ID = S (75 + i.val + 1) ∧
      (entry0178 i).IC = S 12 ∧ (entry0178 i).Inext = T 11 (75 + i.val + 1) ∧
      (entry0178 i).Icur = T 11 (75 + i.val) ∧
      (entry0178 i).output = T 12 (75 + i.val) ∧
      (entry0178 i).charge = charge 11 (75 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0194_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0178 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (75 + i.val)) shift
      (S (75 + i.val + 1)) (S 12) (T 11 (75 + i.val + 1))
      (T 11 (75 + i.val)) (T 12 (75 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0178.entries OriginalRow227TriangleForward0178.checked
    ⟨i.val, by rw [size0178]; exact i.isLt⟩
  change (entry0178 i).check = true at h
  rcases fields0178 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0179 : OriginalRow227TriangleForward0179.entries.size = 32 := rfl

def entry0179 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0179.entries[i.val]'(by rw [size0179]; exact i.isLt)

theorem fields0179 (i : Fin 32) :
    (entry0179 i).IA = shift ∧ (entry0179 i).ID = S (107 + i.val + 1) ∧
      (entry0179 i).IC = S 12 ∧ (entry0179 i).Inext = T 11 (107 + i.val + 1) ∧
      (entry0179 i).Icur = T 11 (107 + i.val) ∧
      (entry0179 i).output = T 12 (107 + i.val) ∧
      (entry0179 i).charge = charge 11 (107 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0195_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0179 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (107 + i.val)) shift
      (S (107 + i.val + 1)) (S 12) (T 11 (107 + i.val + 1))
      (T 11 (107 + i.val)) (T 12 (107 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0179.entries OriginalRow227TriangleForward0179.checked
    ⟨i.val, by rw [size0179]; exact i.isLt⟩
  change (entry0179 i).check = true at h
  rcases fields0179 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0180 : OriginalRow227TriangleForward0180.entries.size = 32 := rfl

def entry0180 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0180.entries[i.val]'(by rw [size0180]; exact i.isLt)

theorem fields0180 (i : Fin 32) :
    (entry0180 i).IA = shift ∧ (entry0180 i).ID = S (139 + i.val + 1) ∧
      (entry0180 i).IC = S 12 ∧ (entry0180 i).Inext = T 11 (139 + i.val + 1) ∧
      (entry0180 i).Icur = T 11 (139 + i.val) ∧
      (entry0180 i).output = T 12 (139 + i.val) ∧
      (entry0180 i).charge = charge 11 (139 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0196_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0180 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (139 + i.val)) shift
      (S (139 + i.val + 1)) (S 12) (T 11 (139 + i.val + 1))
      (T 11 (139 + i.val)) (T 12 (139 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0180.entries OriginalRow227TriangleForward0180.checked
    ⟨i.val, by rw [size0180]; exact i.isLt⟩
  change (entry0180 i).check = true at h
  rcases fields0180 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0181 : OriginalRow227TriangleForward0181.entries.size = 32 := rfl

def entry0181 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0181.entries[i.val]'(by rw [size0181]; exact i.isLt)

theorem fields0181 (i : Fin 32) :
    (entry0181 i).IA = shift ∧ (entry0181 i).ID = S (171 + i.val + 1) ∧
      (entry0181 i).IC = S 12 ∧ (entry0181 i).Inext = T 11 (171 + i.val + 1) ∧
      (entry0181 i).Icur = T 11 (171 + i.val) ∧
      (entry0181 i).output = T 12 (171 + i.val) ∧
      (entry0181 i).charge = charge 11 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0197_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0181 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 12) (T 11 (171 + i.val + 1))
      (T 11 (171 + i.val)) (T 12 (171 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0181.entries OriginalRow227TriangleForward0181.checked
    ⟨i.val, by rw [size0181]; exact i.isLt⟩
  change (entry0181 i).check = true at h
  rcases fields0181 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0182 : OriginalRow227TriangleForward0182.entries.size = 32 := rfl

def entry0182 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0182.entries[i.val]'(by rw [size0182]; exact i.isLt)

theorem fields0182 (i : Fin 32) :
    (entry0182 i).IA = shift ∧ (entry0182 i).ID = S (203 + i.val + 1) ∧
      (entry0182 i).IC = S 12 ∧ (entry0182 i).Inext = T 11 (203 + i.val + 1) ∧
      (entry0182 i).Icur = T 11 (203 + i.val) ∧
      (entry0182 i).output = T 12 (203 + i.val) ∧
      (entry0182 i).charge = charge 11 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0198_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0182 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 12) (T 11 (203 + i.val + 1))
      (T 11 (203 + i.val)) (T 12 (203 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0182.entries OriginalRow227TriangleForward0182.checked
    ⟨i.val, by rw [size0182]; exact i.isLt⟩
  change (entry0182 i).check = true at h
  rcases fields0182 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0183 : OriginalRow227TriangleForward0183.entries.size = 32 := rfl

def entry0183 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0183.entries[i.val]'(by rw [size0183]; exact i.isLt)

theorem fields0183 (i : Fin 32) :
    (entry0183 i).IA = shift ∧ (entry0183 i).ID = S (235 + i.val + 1) ∧
      (entry0183 i).IC = S 12 ∧ (entry0183 i).Inext = T 11 (235 + i.val + 1) ∧
      (entry0183 i).Icur = T 11 (235 + i.val) ∧
      (entry0183 i).output = T 12 (235 + i.val) ∧
      (entry0183 i).charge = charge 11 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0199_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0183 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 12) (T 11 (235 + i.val + 1))
      (T 11 (235 + i.val)) (T 12 (235 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0183.entries OriginalRow227TriangleForward0183.checked
    ⟨i.val, by rw [size0183]; exact i.isLt⟩
  change (entry0183 i).check = true at h
  rcases fields0183 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0184 : OriginalRow227TriangleForward0184.entries.size = 32 := rfl

def entry0184 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0184.entries[i.val]'(by rw [size0184]; exact i.isLt)

theorem fields0184 (i : Fin 32) :
    (entry0184 i).IA = shift ∧ (entry0184 i).ID = S (267 + i.val + 1) ∧
      (entry0184 i).IC = S 12 ∧ (entry0184 i).Inext = T 11 (267 + i.val + 1) ∧
      (entry0184 i).Icur = T 11 (267 + i.val) ∧
      (entry0184 i).output = T 12 (267 + i.val) ∧
      (entry0184 i).charge = charge 11 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0200_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0184 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 12) (T 11 (267 + i.val + 1))
      (T 11 (267 + i.val)) (T 12 (267 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0184.entries OriginalRow227TriangleForward0184.checked
    ⟨i.val, by rw [size0184]; exact i.isLt⟩
  change (entry0184 i).check = true at h
  rcases fields0184 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0185 : OriginalRow227TriangleForward0185.entries.size = 32 := rfl

def entry0185 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0185.entries[i.val]'(by rw [size0185]; exact i.isLt)

theorem fields0185 (i : Fin 32) :
    (entry0185 i).IA = shift ∧ (entry0185 i).ID = S (299 + i.val + 1) ∧
      (entry0185 i).IC = S 12 ∧ (entry0185 i).Inext = T 11 (299 + i.val + 1) ∧
      (entry0185 i).Icur = T 11 (299 + i.val) ∧
      (entry0185 i).output = T 12 (299 + i.val) ∧
      (entry0185 i).charge = charge 11 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0201_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0185 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 12) (T 11 (299 + i.val + 1))
      (T 11 (299 + i.val)) (T 12 (299 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0185.entries OriginalRow227TriangleForward0185.checked
    ⟨i.val, by rw [size0185]; exact i.isLt⟩
  change (entry0185 i).check = true at h
  rcases fields0185 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0186 : OriginalRow227TriangleForward0186.entries.size = 32 := rfl

def entry0186 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0186.entries[i.val]'(by rw [size0186]; exact i.isLt)

theorem fields0186 (i : Fin 32) :
    (entry0186 i).IA = shift ∧ (entry0186 i).ID = S (331 + i.val + 1) ∧
      (entry0186 i).IC = S 12 ∧ (entry0186 i).Inext = T 11 (331 + i.val + 1) ∧
      (entry0186 i).Icur = T 11 (331 + i.val) ∧
      (entry0186 i).output = T 12 (331 + i.val) ∧
      (entry0186 i).charge = charge 11 (331 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0202_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0186 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (331 + i.val)) shift
      (S (331 + i.val + 1)) (S 12) (T 11 (331 + i.val + 1))
      (T 11 (331 + i.val)) (T 12 (331 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0186.entries OriginalRow227TriangleForward0186.checked
    ⟨i.val, by rw [size0186]; exact i.isLt⟩
  change (entry0186 i).check = true at h
  rcases fields0186 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0187 : OriginalRow227TriangleForward0187.entries.size = 32 := rfl

def entry0187 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0187.entries[i.val]'(by rw [size0187]; exact i.isLt)

theorem fields0187 (i : Fin 32) :
    (entry0187 i).IA = shift ∧ (entry0187 i).ID = S (363 + i.val + 1) ∧
      (entry0187 i).IC = S 12 ∧ (entry0187 i).Inext = T 11 (363 + i.val + 1) ∧
      (entry0187 i).Icur = T 11 (363 + i.val) ∧
      (entry0187 i).output = T 12 (363 + i.val) ∧
      (entry0187 i).charge = charge 11 (363 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0203_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0187 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (363 + i.val)) shift
      (S (363 + i.val + 1)) (S 12) (T 11 (363 + i.val + 1))
      (T 11 (363 + i.val)) (T 12 (363 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0187.entries OriginalRow227TriangleForward0187.checked
    ⟨i.val, by rw [size0187]; exact i.isLt⟩
  change (entry0187 i).check = true at h
  rcases fields0187 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0188 : OriginalRow227TriangleForward0188.entries.size = 32 := rfl

def entry0188 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0188.entries[i.val]'(by rw [size0188]; exact i.isLt)

theorem fields0188 (i : Fin 32) :
    (entry0188 i).IA = shift ∧ (entry0188 i).ID = S (395 + i.val + 1) ∧
      (entry0188 i).IC = S 12 ∧ (entry0188 i).Inext = T 11 (395 + i.val + 1) ∧
      (entry0188 i).Icur = T 11 (395 + i.val) ∧
      (entry0188 i).output = T 12 (395 + i.val) ∧
      (entry0188 i).charge = charge 11 (395 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0204_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0188 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (395 + i.val)) shift
      (S (395 + i.val + 1)) (S 12) (T 11 (395 + i.val + 1))
      (T 11 (395 + i.val)) (T 12 (395 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0188.entries OriginalRow227TriangleForward0188.checked
    ⟨i.val, by rw [size0188]; exact i.isLt⟩
  change (entry0188 i).check = true at h
  rcases fields0188 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0189 : OriginalRow227TriangleForward0189.entries.size = 32 := rfl

def entry0189 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0189.entries[i.val]'(by rw [size0189]; exact i.isLt)

theorem fields0189 (i : Fin 32) :
    (entry0189 i).IA = shift ∧ (entry0189 i).ID = S (427 + i.val + 1) ∧
      (entry0189 i).IC = S 12 ∧ (entry0189 i).Inext = T 11 (427 + i.val + 1) ∧
      (entry0189 i).Icur = T 11 (427 + i.val) ∧
      (entry0189 i).output = T 12 (427 + i.val) ∧
      (entry0189 i).charge = charge 11 (427 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0205_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0189 (i : Fin 32) :
    forwardStepOK (-768) (charge 11 (427 + i.val)) shift
      (S (427 + i.val + 1)) (S 12) (T 11 (427 + i.val + 1))
      (T 11 (427 + i.val)) (T 12 (427 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0189.entries OriginalRow227TriangleForward0189.checked
    ⟨i.val, by rw [size0189]; exact i.isLt⟩
  change (entry0189 i).check = true at h
  rcases fields0189 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0190 : OriginalRow227TriangleForward0190.entries.size = 31 := rfl

def entry0190 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0190.entries[i.val]'(by rw [size0190]; exact i.isLt)

theorem fields0190 (i : Fin 31) :
    (entry0190 i).IA = shift ∧ (entry0190 i).ID = S (459 + i.val + 1) ∧
      (entry0190 i).IC = S 12 ∧ (entry0190 i).Inext = T 11 (459 + i.val + 1) ∧
      (entry0190 i).Icur = T 11 (459 + i.val) ∧
      (entry0190 i).output = T 12 (459 + i.val) ∧
      (entry0190 i).charge = charge 11 (459 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow011.block0191_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow012.block0206_value ⟨30, by decide⟩).symm, rfl⟩

theorem step0190 (i : Fin 31) :
    forwardStepOK (-768) (charge 11 (459 + i.val)) shift
      (S (459 + i.val + 1)) (S 12) (T 11 (459 + i.val + 1))
      (T 11 (459 + i.val)) (T 12 (459 + i.val))
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0190.entries OriginalRow227TriangleForward0190.checked
    ⟨i.val, by rw [size0190]; exact i.isLt⟩
  change (entry0190 i).check = true at h
  rcases fields0190 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 11 ≤ d) (hhi : d < 490) :
    forwardStepOK (-768) (charge 11 d) shift (S (d + 1)) (S 12)
      (T 11 (d + 1)) (T 11 d) (T 12 d)
      (OriginalRow227Roots.root_pos 12 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 11 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h107 : d < 107
    ·
      by_cases h43 : d < 43
      ·
        have hi : d - 11 < 32 := by omega
        have heq : 11 + (d - 11) = d := by omega
        simpa only [heq] using step0176 ⟨d - 11, hi⟩
      ·
        by_cases h75 : d < 75
        ·
          have hi : d - 43 < 32 := by omega
          have heq : 43 + (d - 43) = d := by omega
          simpa only [heq] using step0177 ⟨d - 43, hi⟩
        ·
          have hi : d - 75 < 32 := by omega
          have heq : 75 + (d - 75) = d := by omega
          simpa only [heq] using step0178 ⟨d - 75, hi⟩
    ·
      by_cases h171 : d < 171
      ·
        by_cases h139 : d < 139
        ·
          have hi : d - 107 < 32 := by omega
          have heq : 107 + (d - 107) = d := by omega
          simpa only [heq] using step0179 ⟨d - 107, hi⟩
        ·
          have hi : d - 139 < 32 := by omega
          have heq : 139 + (d - 139) = d := by omega
          simpa only [heq] using step0180 ⟨d - 139, hi⟩
      ·
        by_cases h203 : d < 203
        ·
          have hi : d - 171 < 32 := by omega
          have heq : 171 + (d - 171) = d := by omega
          simpa only [heq] using step0181 ⟨d - 171, hi⟩
        ·
          have hi : d - 203 < 32 := by omega
          have heq : 203 + (d - 203) = d := by omega
          simpa only [heq] using step0182 ⟨d - 203, hi⟩
  ·
    by_cases h363 : d < 363
    ·
      by_cases h299 : d < 299
      ·
        by_cases h267 : d < 267
        ·
          have hi : d - 235 < 32 := by omega
          have heq : 235 + (d - 235) = d := by omega
          simpa only [heq] using step0183 ⟨d - 235, hi⟩
        ·
          have hi : d - 267 < 32 := by omega
          have heq : 267 + (d - 267) = d := by omega
          simpa only [heq] using step0184 ⟨d - 267, hi⟩
      ·
        by_cases h331 : d < 331
        ·
          have hi : d - 299 < 32 := by omega
          have heq : 299 + (d - 299) = d := by omega
          simpa only [heq] using step0185 ⟨d - 299, hi⟩
        ·
          have hi : d - 331 < 32 := by omega
          have heq : 331 + (d - 331) = d := by omega
          simpa only [heq] using step0186 ⟨d - 331, hi⟩
    ·
      by_cases h427 : d < 427
      ·
        by_cases h395 : d < 395
        ·
          have hi : d - 363 < 32 := by omega
          have heq : 363 + (d - 363) = d := by omega
          simpa only [heq] using step0187 ⟨d - 363, hi⟩
        ·
          have hi : d - 395 < 32 := by omega
          have heq : 395 + (d - 395) = d := by omega
          simpa only [heq] using step0188 ⟨d - 395, hi⟩
      ·
        by_cases h459 : d < 459
        ·
          have hi : d - 427 < 32 := by omega
          have heq : 427 + (d - 427) = d := by omega
          simpa only [heq] using step0189 ⟨d - 427, hi⟩
        ·
          have hi : d - 459 < 31 := by omega
          have heq : 459 + (d - 459) = d := by omega
          simpa only [heq] using step0190 ⟨d - 459, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0176,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0176,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0177,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0177,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0178,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0178,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0179,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0179,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0180,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0180,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0181,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0181,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0182,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0182,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0183,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0183,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0184,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0184,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0185,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0185,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0186,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0186,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0187,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0187,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0188,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0188,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0189,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0189,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.fields0190,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.step0190,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow012
