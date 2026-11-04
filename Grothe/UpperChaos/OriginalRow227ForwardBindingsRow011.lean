import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011
import Grothe.UpperChaos.OriginalRow227TriangleForward0160
import Grothe.UpperChaos.OriginalRow227TriangleForward0161
import Grothe.UpperChaos.OriginalRow227TriangleForward0162
import Grothe.UpperChaos.OriginalRow227TriangleForward0163
import Grothe.UpperChaos.OriginalRow227TriangleForward0164
import Grothe.UpperChaos.OriginalRow227TriangleForward0165
import Grothe.UpperChaos.OriginalRow227TriangleForward0166
import Grothe.UpperChaos.OriginalRow227TriangleForward0167
import Grothe.UpperChaos.OriginalRow227TriangleForward0168
import Grothe.UpperChaos.OriginalRow227TriangleForward0169
import Grothe.UpperChaos.OriginalRow227TriangleForward0170
import Grothe.UpperChaos.OriginalRow227TriangleForward0171
import Grothe.UpperChaos.OriginalRow227TriangleForward0172
import Grothe.UpperChaos.OriginalRow227TriangleForward0173
import Grothe.UpperChaos.OriginalRow227TriangleForward0174
import Grothe.UpperChaos.OriginalRow227TriangleForward0175

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0160 : OriginalRow227TriangleForward0160.entries.size = 32 := rfl

def entry0160 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0160.entries[i.val]'(by rw [size0160]; exact i.isLt)

theorem fields0160 (i : Fin 32) :
    (entry0160 i).IA = shift ∧ (entry0160 i).ID = S (10 + i.val + 1) ∧
      (entry0160 i).IC = S 11 ∧ (entry0160 i).Inext = T 10 (10 + i.val + 1) ∧
      (entry0160 i).Icur = T 10 (10 + i.val) ∧
      (entry0160 i).output = T 11 (10 + i.val) ∧
      (entry0160 i).charge = charge 10 (10 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0176_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0160 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (10 + i.val)) shift
      (S (10 + i.val + 1)) (S 11) (T 10 (10 + i.val + 1))
      (T 10 (10 + i.val)) (T 11 (10 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0160.entries OriginalRow227TriangleForward0160.checked
    ⟨i.val, by rw [size0160]; exact i.isLt⟩
  change (entry0160 i).check = true at h
  rcases fields0160 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0161 : OriginalRow227TriangleForward0161.entries.size = 32 := rfl

def entry0161 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0161.entries[i.val]'(by rw [size0161]; exact i.isLt)

theorem fields0161 (i : Fin 32) :
    (entry0161 i).IA = shift ∧ (entry0161 i).ID = S (42 + i.val + 1) ∧
      (entry0161 i).IC = S 11 ∧ (entry0161 i).Inext = T 10 (42 + i.val + 1) ∧
      (entry0161 i).Icur = T 10 (42 + i.val) ∧
      (entry0161 i).output = T 11 (42 + i.val) ∧
      (entry0161 i).charge = charge 10 (42 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0177_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0161 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (42 + i.val)) shift
      (S (42 + i.val + 1)) (S 11) (T 10 (42 + i.val + 1))
      (T 10 (42 + i.val)) (T 11 (42 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0161.entries OriginalRow227TriangleForward0161.checked
    ⟨i.val, by rw [size0161]; exact i.isLt⟩
  change (entry0161 i).check = true at h
  rcases fields0161 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0162 : OriginalRow227TriangleForward0162.entries.size = 32 := rfl

def entry0162 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0162.entries[i.val]'(by rw [size0162]; exact i.isLt)

theorem fields0162 (i : Fin 32) :
    (entry0162 i).IA = shift ∧ (entry0162 i).ID = S (74 + i.val + 1) ∧
      (entry0162 i).IC = S 11 ∧ (entry0162 i).Inext = T 10 (74 + i.val + 1) ∧
      (entry0162 i).Icur = T 10 (74 + i.val) ∧
      (entry0162 i).output = T 11 (74 + i.val) ∧
      (entry0162 i).charge = charge 10 (74 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0178_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0162 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (74 + i.val)) shift
      (S (74 + i.val + 1)) (S 11) (T 10 (74 + i.val + 1))
      (T 10 (74 + i.val)) (T 11 (74 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0162.entries OriginalRow227TriangleForward0162.checked
    ⟨i.val, by rw [size0162]; exact i.isLt⟩
  change (entry0162 i).check = true at h
  rcases fields0162 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0163 : OriginalRow227TriangleForward0163.entries.size = 32 := rfl

def entry0163 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0163.entries[i.val]'(by rw [size0163]; exact i.isLt)

theorem fields0163 (i : Fin 32) :
    (entry0163 i).IA = shift ∧ (entry0163 i).ID = S (106 + i.val + 1) ∧
      (entry0163 i).IC = S 11 ∧ (entry0163 i).Inext = T 10 (106 + i.val + 1) ∧
      (entry0163 i).Icur = T 10 (106 + i.val) ∧
      (entry0163 i).output = T 11 (106 + i.val) ∧
      (entry0163 i).charge = charge 10 (106 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0179_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0163 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (106 + i.val)) shift
      (S (106 + i.val + 1)) (S 11) (T 10 (106 + i.val + 1))
      (T 10 (106 + i.val)) (T 11 (106 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0163.entries OriginalRow227TriangleForward0163.checked
    ⟨i.val, by rw [size0163]; exact i.isLt⟩
  change (entry0163 i).check = true at h
  rcases fields0163 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0164 : OriginalRow227TriangleForward0164.entries.size = 32 := rfl

def entry0164 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0164.entries[i.val]'(by rw [size0164]; exact i.isLt)

theorem fields0164 (i : Fin 32) :
    (entry0164 i).IA = shift ∧ (entry0164 i).ID = S (138 + i.val + 1) ∧
      (entry0164 i).IC = S 11 ∧ (entry0164 i).Inext = T 10 (138 + i.val + 1) ∧
      (entry0164 i).Icur = T 10 (138 + i.val) ∧
      (entry0164 i).output = T 11 (138 + i.val) ∧
      (entry0164 i).charge = charge 10 (138 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0180_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0164 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (138 + i.val)) shift
      (S (138 + i.val + 1)) (S 11) (T 10 (138 + i.val + 1))
      (T 10 (138 + i.val)) (T 11 (138 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0164.entries OriginalRow227TriangleForward0164.checked
    ⟨i.val, by rw [size0164]; exact i.isLt⟩
  change (entry0164 i).check = true at h
  rcases fields0164 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0165 : OriginalRow227TriangleForward0165.entries.size = 32 := rfl

def entry0165 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0165.entries[i.val]'(by rw [size0165]; exact i.isLt)

theorem fields0165 (i : Fin 32) :
    (entry0165 i).IA = shift ∧ (entry0165 i).ID = S (170 + i.val + 1) ∧
      (entry0165 i).IC = S 11 ∧ (entry0165 i).Inext = T 10 (170 + i.val + 1) ∧
      (entry0165 i).Icur = T 10 (170 + i.val) ∧
      (entry0165 i).output = T 11 (170 + i.val) ∧
      (entry0165 i).charge = charge 10 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0181_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0165 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 11) (T 10 (170 + i.val + 1))
      (T 10 (170 + i.val)) (T 11 (170 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0165.entries OriginalRow227TriangleForward0165.checked
    ⟨i.val, by rw [size0165]; exact i.isLt⟩
  change (entry0165 i).check = true at h
  rcases fields0165 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0166 : OriginalRow227TriangleForward0166.entries.size = 32 := rfl

def entry0166 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0166.entries[i.val]'(by rw [size0166]; exact i.isLt)

theorem fields0166 (i : Fin 32) :
    (entry0166 i).IA = shift ∧ (entry0166 i).ID = S (202 + i.val + 1) ∧
      (entry0166 i).IC = S 11 ∧ (entry0166 i).Inext = T 10 (202 + i.val + 1) ∧
      (entry0166 i).Icur = T 10 (202 + i.val) ∧
      (entry0166 i).output = T 11 (202 + i.val) ∧
      (entry0166 i).charge = charge 10 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0182_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0166 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 11) (T 10 (202 + i.val + 1))
      (T 10 (202 + i.val)) (T 11 (202 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0166.entries OriginalRow227TriangleForward0166.checked
    ⟨i.val, by rw [size0166]; exact i.isLt⟩
  change (entry0166 i).check = true at h
  rcases fields0166 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0167 : OriginalRow227TriangleForward0167.entries.size = 32 := rfl

def entry0167 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0167.entries[i.val]'(by rw [size0167]; exact i.isLt)

theorem fields0167 (i : Fin 32) :
    (entry0167 i).IA = shift ∧ (entry0167 i).ID = S (234 + i.val + 1) ∧
      (entry0167 i).IC = S 11 ∧ (entry0167 i).Inext = T 10 (234 + i.val + 1) ∧
      (entry0167 i).Icur = T 10 (234 + i.val) ∧
      (entry0167 i).output = T 11 (234 + i.val) ∧
      (entry0167 i).charge = charge 10 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0183_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0167 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 11) (T 10 (234 + i.val + 1))
      (T 10 (234 + i.val)) (T 11 (234 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0167.entries OriginalRow227TriangleForward0167.checked
    ⟨i.val, by rw [size0167]; exact i.isLt⟩
  change (entry0167 i).check = true at h
  rcases fields0167 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0168 : OriginalRow227TriangleForward0168.entries.size = 32 := rfl

def entry0168 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0168.entries[i.val]'(by rw [size0168]; exact i.isLt)

theorem fields0168 (i : Fin 32) :
    (entry0168 i).IA = shift ∧ (entry0168 i).ID = S (266 + i.val + 1) ∧
      (entry0168 i).IC = S 11 ∧ (entry0168 i).Inext = T 10 (266 + i.val + 1) ∧
      (entry0168 i).Icur = T 10 (266 + i.val) ∧
      (entry0168 i).output = T 11 (266 + i.val) ∧
      (entry0168 i).charge = charge 10 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0184_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0168 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 11) (T 10 (266 + i.val + 1))
      (T 10 (266 + i.val)) (T 11 (266 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0168.entries OriginalRow227TriangleForward0168.checked
    ⟨i.val, by rw [size0168]; exact i.isLt⟩
  change (entry0168 i).check = true at h
  rcases fields0168 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0169 : OriginalRow227TriangleForward0169.entries.size = 32 := rfl

def entry0169 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0169.entries[i.val]'(by rw [size0169]; exact i.isLt)

theorem fields0169 (i : Fin 32) :
    (entry0169 i).IA = shift ∧ (entry0169 i).ID = S (298 + i.val + 1) ∧
      (entry0169 i).IC = S 11 ∧ (entry0169 i).Inext = T 10 (298 + i.val + 1) ∧
      (entry0169 i).Icur = T 10 (298 + i.val) ∧
      (entry0169 i).output = T 11 (298 + i.val) ∧
      (entry0169 i).charge = charge 10 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0185_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0169 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 11) (T 10 (298 + i.val + 1))
      (T 10 (298 + i.val)) (T 11 (298 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0169.entries OriginalRow227TriangleForward0169.checked
    ⟨i.val, by rw [size0169]; exact i.isLt⟩
  change (entry0169 i).check = true at h
  rcases fields0169 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0170 : OriginalRow227TriangleForward0170.entries.size = 32 := rfl

def entry0170 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0170.entries[i.val]'(by rw [size0170]; exact i.isLt)

theorem fields0170 (i : Fin 32) :
    (entry0170 i).IA = shift ∧ (entry0170 i).ID = S (330 + i.val + 1) ∧
      (entry0170 i).IC = S 11 ∧ (entry0170 i).Inext = T 10 (330 + i.val + 1) ∧
      (entry0170 i).Icur = T 10 (330 + i.val) ∧
      (entry0170 i).output = T 11 (330 + i.val) ∧
      (entry0170 i).charge = charge 10 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0186_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0170 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 11) (T 10 (330 + i.val + 1))
      (T 10 (330 + i.val)) (T 11 (330 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0170.entries OriginalRow227TriangleForward0170.checked
    ⟨i.val, by rw [size0170]; exact i.isLt⟩
  change (entry0170 i).check = true at h
  rcases fields0170 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0171 : OriginalRow227TriangleForward0171.entries.size = 32 := rfl

def entry0171 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0171.entries[i.val]'(by rw [size0171]; exact i.isLt)

theorem fields0171 (i : Fin 32) :
    (entry0171 i).IA = shift ∧ (entry0171 i).ID = S (362 + i.val + 1) ∧
      (entry0171 i).IC = S 11 ∧ (entry0171 i).Inext = T 10 (362 + i.val + 1) ∧
      (entry0171 i).Icur = T 10 (362 + i.val) ∧
      (entry0171 i).output = T 11 (362 + i.val) ∧
      (entry0171 i).charge = charge 10 (362 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0187_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0171 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (362 + i.val)) shift
      (S (362 + i.val + 1)) (S 11) (T 10 (362 + i.val + 1))
      (T 10 (362 + i.val)) (T 11 (362 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0171.entries OriginalRow227TriangleForward0171.checked
    ⟨i.val, by rw [size0171]; exact i.isLt⟩
  change (entry0171 i).check = true at h
  rcases fields0171 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0172 : OriginalRow227TriangleForward0172.entries.size = 32 := rfl

def entry0172 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0172.entries[i.val]'(by rw [size0172]; exact i.isLt)

theorem fields0172 (i : Fin 32) :
    (entry0172 i).IA = shift ∧ (entry0172 i).ID = S (394 + i.val + 1) ∧
      (entry0172 i).IC = S 11 ∧ (entry0172 i).Inext = T 10 (394 + i.val + 1) ∧
      (entry0172 i).Icur = T 10 (394 + i.val) ∧
      (entry0172 i).output = T 11 (394 + i.val) ∧
      (entry0172 i).charge = charge 10 (394 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0188_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0172 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (394 + i.val)) shift
      (S (394 + i.val + 1)) (S 11) (T 10 (394 + i.val + 1))
      (T 10 (394 + i.val)) (T 11 (394 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0172.entries OriginalRow227TriangleForward0172.checked
    ⟨i.val, by rw [size0172]; exact i.isLt⟩
  change (entry0172 i).check = true at h
  rcases fields0172 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0173 : OriginalRow227TriangleForward0173.entries.size = 32 := rfl

def entry0173 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0173.entries[i.val]'(by rw [size0173]; exact i.isLt)

theorem fields0173 (i : Fin 32) :
    (entry0173 i).IA = shift ∧ (entry0173 i).ID = S (426 + i.val + 1) ∧
      (entry0173 i).IC = S 11 ∧ (entry0173 i).Inext = T 10 (426 + i.val + 1) ∧
      (entry0173 i).Icur = T 10 (426 + i.val) ∧
      (entry0173 i).output = T 11 (426 + i.val) ∧
      (entry0173 i).charge = charge 10 (426 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0189_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0173 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (426 + i.val)) shift
      (S (426 + i.val + 1)) (S 11) (T 10 (426 + i.val + 1))
      (T 10 (426 + i.val)) (T 11 (426 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0173.entries OriginalRow227TriangleForward0173.checked
    ⟨i.val, by rw [size0173]; exact i.isLt⟩
  change (entry0173 i).check = true at h
  rcases fields0173 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0174 : OriginalRow227TriangleForward0174.entries.size = 32 := rfl

def entry0174 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0174.entries[i.val]'(by rw [size0174]; exact i.isLt)

theorem fields0174 (i : Fin 32) :
    (entry0174 i).IA = shift ∧ (entry0174 i).ID = S (458 + i.val + 1) ∧
      (entry0174 i).IC = S 11 ∧ (entry0174 i).Inext = T 10 (458 + i.val + 1) ∧
      (entry0174 i).Icur = T 10 (458 + i.val) ∧
      (entry0174 i).output = T 11 (458 + i.val) ∧
      (entry0174 i).charge = charge 10 (458 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0190_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0174 (i : Fin 32) :
    forwardStepOK (-768) (charge 10 (458 + i.val)) shift
      (S (458 + i.val + 1)) (S 11) (T 10 (458 + i.val + 1))
      (T 10 (458 + i.val)) (T 11 (458 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0174.entries OriginalRow227TriangleForward0174.checked
    ⟨i.val, by rw [size0174]; exact i.isLt⟩
  change (entry0174 i).check = true at h
  rcases fields0174 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0175 : OriginalRow227TriangleForward0175.entries.size = 1 := rfl

def entry0175 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0175.entries[i.val]'(by rw [size0175]; exact i.isLt)

theorem fields0175 (i : Fin 1) :
    (entry0175 i).IA = shift ∧ (entry0175 i).ID = S (490 + i.val + 1) ∧
      (entry0175 i).IC = S 11 ∧ (entry0175 i).Inext = T 10 (490 + i.val + 1) ∧
      (entry0175 i).Icur = T 10 (490 + i.val) ∧
      (entry0175 i).output = T 11 (490 + i.val) ∧
      (entry0175 i).charge = charge 10 (490 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow011.block0191_value ⟨0, by decide⟩).symm, rfl⟩

theorem step0175 (i : Fin 1) :
    forwardStepOK (-768) (charge 10 (490 + i.val)) shift
      (S (490 + i.val + 1)) (S 11) (T 10 (490 + i.val + 1))
      (T 10 (490 + i.val)) (T 11 (490 + i.val))
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0175.entries OriginalRow227TriangleForward0175.checked
    ⟨i.val, by rw [size0175]; exact i.isLt⟩
  change (entry0175 i).check = true at h
  rcases fields0175 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 10 ≤ d) (hhi : d < 491) :
    forwardStepOK (-768) (charge 10 d) shift (S (d + 1)) (S 11)
      (T 10 (d + 1)) (T 10 d) (T 11 d)
      (OriginalRow227Roots.root_pos 11 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 10 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h138 : d < 138
    ·
      by_cases h74 : d < 74
      ·
        by_cases h42 : d < 42
        ·
          have hi : d - 10 < 32 := by omega
          have heq : 10 + (d - 10) = d := by omega
          simpa only [heq] using step0160 ⟨d - 10, hi⟩
        ·
          have hi : d - 42 < 32 := by omega
          have heq : 42 + (d - 42) = d := by omega
          simpa only [heq] using step0161 ⟨d - 42, hi⟩
      ·
        by_cases h106 : d < 106
        ·
          have hi : d - 74 < 32 := by omega
          have heq : 74 + (d - 74) = d := by omega
          simpa only [heq] using step0162 ⟨d - 74, hi⟩
        ·
          have hi : d - 106 < 32 := by omega
          have heq : 106 + (d - 106) = d := by omega
          simpa only [heq] using step0163 ⟨d - 106, hi⟩
    ·
      by_cases h202 : d < 202
      ·
        by_cases h170 : d < 170
        ·
          have hi : d - 138 < 32 := by omega
          have heq : 138 + (d - 138) = d := by omega
          simpa only [heq] using step0164 ⟨d - 138, hi⟩
        ·
          have hi : d - 170 < 32 := by omega
          have heq : 170 + (d - 170) = d := by omega
          simpa only [heq] using step0165 ⟨d - 170, hi⟩
      ·
        by_cases h234 : d < 234
        ·
          have hi : d - 202 < 32 := by omega
          have heq : 202 + (d - 202) = d := by omega
          simpa only [heq] using step0166 ⟨d - 202, hi⟩
        ·
          have hi : d - 234 < 32 := by omega
          have heq : 234 + (d - 234) = d := by omega
          simpa only [heq] using step0167 ⟨d - 234, hi⟩
  ·
    by_cases h394 : d < 394
    ·
      by_cases h330 : d < 330
      ·
        by_cases h298 : d < 298
        ·
          have hi : d - 266 < 32 := by omega
          have heq : 266 + (d - 266) = d := by omega
          simpa only [heq] using step0168 ⟨d - 266, hi⟩
        ·
          have hi : d - 298 < 32 := by omega
          have heq : 298 + (d - 298) = d := by omega
          simpa only [heq] using step0169 ⟨d - 298, hi⟩
      ·
        by_cases h362 : d < 362
        ·
          have hi : d - 330 < 32 := by omega
          have heq : 330 + (d - 330) = d := by omega
          simpa only [heq] using step0170 ⟨d - 330, hi⟩
        ·
          have hi : d - 362 < 32 := by omega
          have heq : 362 + (d - 362) = d := by omega
          simpa only [heq] using step0171 ⟨d - 362, hi⟩
    ·
      by_cases h458 : d < 458
      ·
        by_cases h426 : d < 426
        ·
          have hi : d - 394 < 32 := by omega
          have heq : 394 + (d - 394) = d := by omega
          simpa only [heq] using step0172 ⟨d - 394, hi⟩
        ·
          have hi : d - 426 < 32 := by omega
          have heq : 426 + (d - 426) = d := by omega
          simpa only [heq] using step0173 ⟨d - 426, hi⟩
      ·
        by_cases h490 : d < 490
        ·
          have hi : d - 458 < 32 := by omega
          have heq : 458 + (d - 458) = d := by omega
          simpa only [heq] using step0174 ⟨d - 458, hi⟩
        ·
          have hi : d - 490 < 1 := by omega
          have heq : 490 + (d - 490) = d := by omega
          simpa only [heq] using step0175 ⟨d - 490, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0160,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0160,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0161,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0161,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0162,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0162,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0163,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0163,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0164,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0164,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0165,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0165,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0166,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0166,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0167,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0167,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0168,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0168,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0169,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0169,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0170,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0170,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0171,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0171,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0172,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0172,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0173,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0173,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0174,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0174,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.fields0175,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.step0175,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow011
