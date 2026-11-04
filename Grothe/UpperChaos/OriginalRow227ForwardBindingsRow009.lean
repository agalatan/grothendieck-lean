import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009
import Grothe.UpperChaos.OriginalRow227TriangleForward0128
import Grothe.UpperChaos.OriginalRow227TriangleForward0129
import Grothe.UpperChaos.OriginalRow227TriangleForward0130
import Grothe.UpperChaos.OriginalRow227TriangleForward0131
import Grothe.UpperChaos.OriginalRow227TriangleForward0132
import Grothe.UpperChaos.OriginalRow227TriangleForward0133
import Grothe.UpperChaos.OriginalRow227TriangleForward0134
import Grothe.UpperChaos.OriginalRow227TriangleForward0135
import Grothe.UpperChaos.OriginalRow227TriangleForward0136
import Grothe.UpperChaos.OriginalRow227TriangleForward0137
import Grothe.UpperChaos.OriginalRow227TriangleForward0138
import Grothe.UpperChaos.OriginalRow227TriangleForward0139
import Grothe.UpperChaos.OriginalRow227TriangleForward0140
import Grothe.UpperChaos.OriginalRow227TriangleForward0141
import Grothe.UpperChaos.OriginalRow227TriangleForward0142
import Grothe.UpperChaos.OriginalRow227TriangleForward0143

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0128 : OriginalRow227TriangleForward0128.entries.size = 32 := rfl

def entry0128 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0128.entries[i.val]'(by rw [size0128]; exact i.isLt)

theorem fields0128 (i : Fin 32) :
    (entry0128 i).IA = shift ∧ (entry0128 i).ID = S (8 + i.val + 1) ∧
      (entry0128 i).IC = S 9 ∧ (entry0128 i).Inext = T 8 (8 + i.val + 1) ∧
      (entry0128 i).Icur = T 8 (8 + i.val) ∧
      (entry0128 i).output = T 9 (8 + i.val) ∧
      (entry0128 i).charge = charge 8 (8 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0128_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0128 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (8 + i.val)) shift
      (S (8 + i.val + 1)) (S 9) (T 8 (8 + i.val + 1))
      (T 8 (8 + i.val)) (T 9 (8 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0128.entries OriginalRow227TriangleForward0128.checked
    ⟨i.val, by rw [size0128]; exact i.isLt⟩
  change (entry0128 i).check = true at h
  rcases fields0128 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0129 : OriginalRow227TriangleForward0129.entries.size = 32 := rfl

def entry0129 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0129.entries[i.val]'(by rw [size0129]; exact i.isLt)

theorem fields0129 (i : Fin 32) :
    (entry0129 i).IA = shift ∧ (entry0129 i).ID = S (40 + i.val + 1) ∧
      (entry0129 i).IC = S 9 ∧ (entry0129 i).Inext = T 8 (40 + i.val + 1) ∧
      (entry0129 i).Icur = T 8 (40 + i.val) ∧
      (entry0129 i).output = T 9 (40 + i.val) ∧
      (entry0129 i).charge = charge 8 (40 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0129_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0129 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (40 + i.val)) shift
      (S (40 + i.val + 1)) (S 9) (T 8 (40 + i.val + 1))
      (T 8 (40 + i.val)) (T 9 (40 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0129.entries OriginalRow227TriangleForward0129.checked
    ⟨i.val, by rw [size0129]; exact i.isLt⟩
  change (entry0129 i).check = true at h
  rcases fields0129 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0130 : OriginalRow227TriangleForward0130.entries.size = 32 := rfl

def entry0130 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0130.entries[i.val]'(by rw [size0130]; exact i.isLt)

theorem fields0130 (i : Fin 32) :
    (entry0130 i).IA = shift ∧ (entry0130 i).ID = S (72 + i.val + 1) ∧
      (entry0130 i).IC = S 9 ∧ (entry0130 i).Inext = T 8 (72 + i.val + 1) ∧
      (entry0130 i).Icur = T 8 (72 + i.val) ∧
      (entry0130 i).output = T 9 (72 + i.val) ∧
      (entry0130 i).charge = charge 8 (72 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0130_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0130 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (72 + i.val)) shift
      (S (72 + i.val + 1)) (S 9) (T 8 (72 + i.val + 1))
      (T 8 (72 + i.val)) (T 9 (72 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0130.entries OriginalRow227TriangleForward0130.checked
    ⟨i.val, by rw [size0130]; exact i.isLt⟩
  change (entry0130 i).check = true at h
  rcases fields0130 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0131 : OriginalRow227TriangleForward0131.entries.size = 32 := rfl

def entry0131 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0131.entries[i.val]'(by rw [size0131]; exact i.isLt)

theorem fields0131 (i : Fin 32) :
    (entry0131 i).IA = shift ∧ (entry0131 i).ID = S (104 + i.val + 1) ∧
      (entry0131 i).IC = S 9 ∧ (entry0131 i).Inext = T 8 (104 + i.val + 1) ∧
      (entry0131 i).Icur = T 8 (104 + i.val) ∧
      (entry0131 i).output = T 9 (104 + i.val) ∧
      (entry0131 i).charge = charge 8 (104 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0131_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0131 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (104 + i.val)) shift
      (S (104 + i.val + 1)) (S 9) (T 8 (104 + i.val + 1))
      (T 8 (104 + i.val)) (T 9 (104 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0131.entries OriginalRow227TriangleForward0131.checked
    ⟨i.val, by rw [size0131]; exact i.isLt⟩
  change (entry0131 i).check = true at h
  rcases fields0131 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0132 : OriginalRow227TriangleForward0132.entries.size = 32 := rfl

def entry0132 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0132.entries[i.val]'(by rw [size0132]; exact i.isLt)

theorem fields0132 (i : Fin 32) :
    (entry0132 i).IA = shift ∧ (entry0132 i).ID = S (136 + i.val + 1) ∧
      (entry0132 i).IC = S 9 ∧ (entry0132 i).Inext = T 8 (136 + i.val + 1) ∧
      (entry0132 i).Icur = T 8 (136 + i.val) ∧
      (entry0132 i).output = T 9 (136 + i.val) ∧
      (entry0132 i).charge = charge 8 (136 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0132_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0132 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (136 + i.val)) shift
      (S (136 + i.val + 1)) (S 9) (T 8 (136 + i.val + 1))
      (T 8 (136 + i.val)) (T 9 (136 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0132.entries OriginalRow227TriangleForward0132.checked
    ⟨i.val, by rw [size0132]; exact i.isLt⟩
  change (entry0132 i).check = true at h
  rcases fields0132 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0133 : OriginalRow227TriangleForward0133.entries.size = 32 := rfl

def entry0133 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0133.entries[i.val]'(by rw [size0133]; exact i.isLt)

theorem fields0133 (i : Fin 32) :
    (entry0133 i).IA = shift ∧ (entry0133 i).ID = S (168 + i.val + 1) ∧
      (entry0133 i).IC = S 9 ∧ (entry0133 i).Inext = T 8 (168 + i.val + 1) ∧
      (entry0133 i).Icur = T 8 (168 + i.val) ∧
      (entry0133 i).output = T 9 (168 + i.val) ∧
      (entry0133 i).charge = charge 8 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0133_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0133 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 9) (T 8 (168 + i.val + 1))
      (T 8 (168 + i.val)) (T 9 (168 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0133.entries OriginalRow227TriangleForward0133.checked
    ⟨i.val, by rw [size0133]; exact i.isLt⟩
  change (entry0133 i).check = true at h
  rcases fields0133 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0134 : OriginalRow227TriangleForward0134.entries.size = 32 := rfl

def entry0134 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0134.entries[i.val]'(by rw [size0134]; exact i.isLt)

theorem fields0134 (i : Fin 32) :
    (entry0134 i).IA = shift ∧ (entry0134 i).ID = S (200 + i.val + 1) ∧
      (entry0134 i).IC = S 9 ∧ (entry0134 i).Inext = T 8 (200 + i.val + 1) ∧
      (entry0134 i).Icur = T 8 (200 + i.val) ∧
      (entry0134 i).output = T 9 (200 + i.val) ∧
      (entry0134 i).charge = charge 8 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0134_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0134 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 9) (T 8 (200 + i.val + 1))
      (T 8 (200 + i.val)) (T 9 (200 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0134.entries OriginalRow227TriangleForward0134.checked
    ⟨i.val, by rw [size0134]; exact i.isLt⟩
  change (entry0134 i).check = true at h
  rcases fields0134 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0135 : OriginalRow227TriangleForward0135.entries.size = 32 := rfl

def entry0135 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0135.entries[i.val]'(by rw [size0135]; exact i.isLt)

theorem fields0135 (i : Fin 32) :
    (entry0135 i).IA = shift ∧ (entry0135 i).ID = S (232 + i.val + 1) ∧
      (entry0135 i).IC = S 9 ∧ (entry0135 i).Inext = T 8 (232 + i.val + 1) ∧
      (entry0135 i).Icur = T 8 (232 + i.val) ∧
      (entry0135 i).output = T 9 (232 + i.val) ∧
      (entry0135 i).charge = charge 8 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0135_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0135 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 9) (T 8 (232 + i.val + 1))
      (T 8 (232 + i.val)) (T 9 (232 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0135.entries OriginalRow227TriangleForward0135.checked
    ⟨i.val, by rw [size0135]; exact i.isLt⟩
  change (entry0135 i).check = true at h
  rcases fields0135 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0136 : OriginalRow227TriangleForward0136.entries.size = 32 := rfl

def entry0136 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0136.entries[i.val]'(by rw [size0136]; exact i.isLt)

theorem fields0136 (i : Fin 32) :
    (entry0136 i).IA = shift ∧ (entry0136 i).ID = S (264 + i.val + 1) ∧
      (entry0136 i).IC = S 9 ∧ (entry0136 i).Inext = T 8 (264 + i.val + 1) ∧
      (entry0136 i).Icur = T 8 (264 + i.val) ∧
      (entry0136 i).output = T 9 (264 + i.val) ∧
      (entry0136 i).charge = charge 8 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0136_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0136 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 9) (T 8 (264 + i.val + 1))
      (T 8 (264 + i.val)) (T 9 (264 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0136.entries OriginalRow227TriangleForward0136.checked
    ⟨i.val, by rw [size0136]; exact i.isLt⟩
  change (entry0136 i).check = true at h
  rcases fields0136 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0137 : OriginalRow227TriangleForward0137.entries.size = 32 := rfl

def entry0137 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0137.entries[i.val]'(by rw [size0137]; exact i.isLt)

theorem fields0137 (i : Fin 32) :
    (entry0137 i).IA = shift ∧ (entry0137 i).ID = S (296 + i.val + 1) ∧
      (entry0137 i).IC = S 9 ∧ (entry0137 i).Inext = T 8 (296 + i.val + 1) ∧
      (entry0137 i).Icur = T 8 (296 + i.val) ∧
      (entry0137 i).output = T 9 (296 + i.val) ∧
      (entry0137 i).charge = charge 8 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0137_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0137 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 9) (T 8 (296 + i.val + 1))
      (T 8 (296 + i.val)) (T 9 (296 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0137.entries OriginalRow227TriangleForward0137.checked
    ⟨i.val, by rw [size0137]; exact i.isLt⟩
  change (entry0137 i).check = true at h
  rcases fields0137 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0138 : OriginalRow227TriangleForward0138.entries.size = 32 := rfl

def entry0138 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0138.entries[i.val]'(by rw [size0138]; exact i.isLt)

theorem fields0138 (i : Fin 32) :
    (entry0138 i).IA = shift ∧ (entry0138 i).ID = S (328 + i.val + 1) ∧
      (entry0138 i).IC = S 9 ∧ (entry0138 i).Inext = T 8 (328 + i.val + 1) ∧
      (entry0138 i).Icur = T 8 (328 + i.val) ∧
      (entry0138 i).output = T 9 (328 + i.val) ∧
      (entry0138 i).charge = charge 8 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0138_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0138 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 9) (T 8 (328 + i.val + 1))
      (T 8 (328 + i.val)) (T 9 (328 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0138.entries OriginalRow227TriangleForward0138.checked
    ⟨i.val, by rw [size0138]; exact i.isLt⟩
  change (entry0138 i).check = true at h
  rcases fields0138 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0139 : OriginalRow227TriangleForward0139.entries.size = 32 := rfl

def entry0139 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0139.entries[i.val]'(by rw [size0139]; exact i.isLt)

theorem fields0139 (i : Fin 32) :
    (entry0139 i).IA = shift ∧ (entry0139 i).ID = S (360 + i.val + 1) ∧
      (entry0139 i).IC = S 9 ∧ (entry0139 i).Inext = T 8 (360 + i.val + 1) ∧
      (entry0139 i).Icur = T 8 (360 + i.val) ∧
      (entry0139 i).output = T 9 (360 + i.val) ∧
      (entry0139 i).charge = charge 8 (360 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0139_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0139 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (360 + i.val)) shift
      (S (360 + i.val + 1)) (S 9) (T 8 (360 + i.val + 1))
      (T 8 (360 + i.val)) (T 9 (360 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0139.entries OriginalRow227TriangleForward0139.checked
    ⟨i.val, by rw [size0139]; exact i.isLt⟩
  change (entry0139 i).check = true at h
  rcases fields0139 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0140 : OriginalRow227TriangleForward0140.entries.size = 32 := rfl

def entry0140 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0140.entries[i.val]'(by rw [size0140]; exact i.isLt)

theorem fields0140 (i : Fin 32) :
    (entry0140 i).IA = shift ∧ (entry0140 i).ID = S (392 + i.val + 1) ∧
      (entry0140 i).IC = S 9 ∧ (entry0140 i).Inext = T 8 (392 + i.val + 1) ∧
      (entry0140 i).Icur = T 8 (392 + i.val) ∧
      (entry0140 i).output = T 9 (392 + i.val) ∧
      (entry0140 i).charge = charge 8 (392 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0140_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0140 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (392 + i.val)) shift
      (S (392 + i.val + 1)) (S 9) (T 8 (392 + i.val + 1))
      (T 8 (392 + i.val)) (T 9 (392 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0140.entries OriginalRow227TriangleForward0140.checked
    ⟨i.val, by rw [size0140]; exact i.isLt⟩
  change (entry0140 i).check = true at h
  rcases fields0140 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0141 : OriginalRow227TriangleForward0141.entries.size = 32 := rfl

def entry0141 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0141.entries[i.val]'(by rw [size0141]; exact i.isLt)

theorem fields0141 (i : Fin 32) :
    (entry0141 i).IA = shift ∧ (entry0141 i).ID = S (424 + i.val + 1) ∧
      (entry0141 i).IC = S 9 ∧ (entry0141 i).Inext = T 8 (424 + i.val + 1) ∧
      (entry0141 i).Icur = T 8 (424 + i.val) ∧
      (entry0141 i).output = T 9 (424 + i.val) ∧
      (entry0141 i).charge = charge 8 (424 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0141_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0141 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (424 + i.val)) shift
      (S (424 + i.val + 1)) (S 9) (T 8 (424 + i.val + 1))
      (T 8 (424 + i.val)) (T 9 (424 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0141.entries OriginalRow227TriangleForward0141.checked
    ⟨i.val, by rw [size0141]; exact i.isLt⟩
  change (entry0141 i).check = true at h
  rcases fields0141 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0142 : OriginalRow227TriangleForward0142.entries.size = 32 := rfl

def entry0142 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0142.entries[i.val]'(by rw [size0142]; exact i.isLt)

theorem fields0142 (i : Fin 32) :
    (entry0142 i).IA = shift ∧ (entry0142 i).ID = S (456 + i.val + 1) ∧
      (entry0142 i).IC = S 9 ∧ (entry0142 i).Inext = T 8 (456 + i.val + 1) ∧
      (entry0142 i).Icur = T 8 (456 + i.val) ∧
      (entry0142 i).output = T 9 (456 + i.val) ∧
      (entry0142 i).charge = charge 8 (456 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0142_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0142 (i : Fin 32) :
    forwardStepOK (-768) (charge 8 (456 + i.val)) shift
      (S (456 + i.val + 1)) (S 9) (T 8 (456 + i.val + 1))
      (T 8 (456 + i.val)) (T 9 (456 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0142.entries OriginalRow227TriangleForward0142.checked
    ⟨i.val, by rw [size0142]; exact i.isLt⟩
  change (entry0142 i).check = true at h
  rcases fields0142 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0143 : OriginalRow227TriangleForward0143.entries.size = 5 := rfl

def entry0143 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0143.entries[i.val]'(by rw [size0143]; exact i.isLt)

theorem fields0143 (i : Fin 5) :
    (entry0143 i).IA = shift ∧ (entry0143 i).ID = S (488 + i.val + 1) ∧
      (entry0143 i).IC = S 9 ∧ (entry0143 i).Inext = T 8 (488 + i.val + 1) ∧
      (entry0143 i).Icur = T 8 (488 + i.val) ∧
      (entry0143 i).output = T 9 (488 + i.val) ∧
      (entry0143 i).charge = charge 8 (488 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow008.block0143_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨4, by decide⟩).symm, rfl⟩

theorem step0143 (i : Fin 5) :
    forwardStepOK (-768) (charge 8 (488 + i.val)) shift
      (S (488 + i.val + 1)) (S 9) (T 8 (488 + i.val + 1))
      (T 8 (488 + i.val)) (T 9 (488 + i.val))
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0143.entries OriginalRow227TriangleForward0143.checked
    ⟨i.val, by rw [size0143]; exact i.isLt⟩
  change (entry0143 i).check = true at h
  rcases fields0143 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 8 ≤ d) (hhi : d < 493) :
    forwardStepOK (-768) (charge 8 d) shift (S (d + 1)) (S 9)
      (T 8 (d + 1)) (T 8 d) (T 9 d)
      (OriginalRow227Roots.root_pos 9 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 8 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h136 : d < 136
    ·
      by_cases h72 : d < 72
      ·
        by_cases h40 : d < 40
        ·
          have hi : d - 8 < 32 := by omega
          have heq : 8 + (d - 8) = d := by omega
          simpa only [heq] using step0128 ⟨d - 8, hi⟩
        ·
          have hi : d - 40 < 32 := by omega
          have heq : 40 + (d - 40) = d := by omega
          simpa only [heq] using step0129 ⟨d - 40, hi⟩
      ·
        by_cases h104 : d < 104
        ·
          have hi : d - 72 < 32 := by omega
          have heq : 72 + (d - 72) = d := by omega
          simpa only [heq] using step0130 ⟨d - 72, hi⟩
        ·
          have hi : d - 104 < 32 := by omega
          have heq : 104 + (d - 104) = d := by omega
          simpa only [heq] using step0131 ⟨d - 104, hi⟩
    ·
      by_cases h200 : d < 200
      ·
        by_cases h168 : d < 168
        ·
          have hi : d - 136 < 32 := by omega
          have heq : 136 + (d - 136) = d := by omega
          simpa only [heq] using step0132 ⟨d - 136, hi⟩
        ·
          have hi : d - 168 < 32 := by omega
          have heq : 168 + (d - 168) = d := by omega
          simpa only [heq] using step0133 ⟨d - 168, hi⟩
      ·
        by_cases h232 : d < 232
        ·
          have hi : d - 200 < 32 := by omega
          have heq : 200 + (d - 200) = d := by omega
          simpa only [heq] using step0134 ⟨d - 200, hi⟩
        ·
          have hi : d - 232 < 32 := by omega
          have heq : 232 + (d - 232) = d := by omega
          simpa only [heq] using step0135 ⟨d - 232, hi⟩
  ·
    by_cases h392 : d < 392
    ·
      by_cases h328 : d < 328
      ·
        by_cases h296 : d < 296
        ·
          have hi : d - 264 < 32 := by omega
          have heq : 264 + (d - 264) = d := by omega
          simpa only [heq] using step0136 ⟨d - 264, hi⟩
        ·
          have hi : d - 296 < 32 := by omega
          have heq : 296 + (d - 296) = d := by omega
          simpa only [heq] using step0137 ⟨d - 296, hi⟩
      ·
        by_cases h360 : d < 360
        ·
          have hi : d - 328 < 32 := by omega
          have heq : 328 + (d - 328) = d := by omega
          simpa only [heq] using step0138 ⟨d - 328, hi⟩
        ·
          have hi : d - 360 < 32 := by omega
          have heq : 360 + (d - 360) = d := by omega
          simpa only [heq] using step0139 ⟨d - 360, hi⟩
    ·
      by_cases h456 : d < 456
      ·
        by_cases h424 : d < 424
        ·
          have hi : d - 392 < 32 := by omega
          have heq : 392 + (d - 392) = d := by omega
          simpa only [heq] using step0140 ⟨d - 392, hi⟩
        ·
          have hi : d - 424 < 32 := by omega
          have heq : 424 + (d - 424) = d := by omega
          simpa only [heq] using step0141 ⟨d - 424, hi⟩
      ·
        by_cases h488 : d < 488
        ·
          have hi : d - 456 < 32 := by omega
          have heq : 456 + (d - 456) = d := by omega
          simpa only [heq] using step0142 ⟨d - 456, hi⟩
        ·
          have hi : d - 488 < 5 := by omega
          have heq : 488 + (d - 488) = d := by omega
          simpa only [heq] using step0143 ⟨d - 488, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0128,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0128,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0129,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0129,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0130,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0130,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0131,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0131,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0132,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0132,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0133,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0133,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0134,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0134,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0135,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0135,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0136,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0136,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0137,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0137,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0138,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0138,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0139,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0139,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0140,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0140,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0141,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0141,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0142,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0142,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.fields0143,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.step0143,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow009
