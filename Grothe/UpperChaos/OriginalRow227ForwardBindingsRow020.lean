import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020
import Grothe.UpperChaos.OriginalRow227TriangleForward0296
import Grothe.UpperChaos.OriginalRow227TriangleForward0297
import Grothe.UpperChaos.OriginalRow227TriangleForward0298
import Grothe.UpperChaos.OriginalRow227TriangleForward0299
import Grothe.UpperChaos.OriginalRow227TriangleForward0300
import Grothe.UpperChaos.OriginalRow227TriangleForward0301
import Grothe.UpperChaos.OriginalRow227TriangleForward0302
import Grothe.UpperChaos.OriginalRow227TriangleForward0303
import Grothe.UpperChaos.OriginalRow227TriangleForward0304
import Grothe.UpperChaos.OriginalRow227TriangleForward0305
import Grothe.UpperChaos.OriginalRow227TriangleForward0306
import Grothe.UpperChaos.OriginalRow227TriangleForward0307
import Grothe.UpperChaos.OriginalRow227TriangleForward0308
import Grothe.UpperChaos.OriginalRow227TriangleForward0309
import Grothe.UpperChaos.OriginalRow227TriangleForward0310

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0296 : OriginalRow227TriangleForward0296.entries.size = 32 := rfl

def entry0296 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0296.entries[i.val]'(by rw [size0296]; exact i.isLt)

theorem fields0296 (i : Fin 32) :
    (entry0296 i).IA = shift ∧ (entry0296 i).ID = S (19 + i.val + 1) ∧
      (entry0296 i).IC = S 20 ∧ (entry0296 i).Inext = T 19 (19 + i.val + 1) ∧
      (entry0296 i).Icur = T 19 (19 + i.val) ∧
      (entry0296 i).output = T 20 (19 + i.val) ∧
      (entry0296 i).charge = charge 19 (19 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0296 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (19 + i.val)) shift
      (S (19 + i.val + 1)) (S 20) (T 19 (19 + i.val + 1))
      (T 19 (19 + i.val)) (T 20 (19 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0296.entries OriginalRow227TriangleForward0296.checked
    ⟨i.val, by rw [size0296]; exact i.isLt⟩
  change (entry0296 i).check = true at h
  rcases fields0296 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0297 : OriginalRow227TriangleForward0297.entries.size = 32 := rfl

def entry0297 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0297.entries[i.val]'(by rw [size0297]; exact i.isLt)

theorem fields0297 (i : Fin 32) :
    (entry0297 i).IA = shift ∧ (entry0297 i).ID = S (51 + i.val + 1) ∧
      (entry0297 i).IC = S 20 ∧ (entry0297 i).Inext = T 19 (51 + i.val + 1) ∧
      (entry0297 i).Icur = T 19 (51 + i.val) ∧
      (entry0297 i).output = T 20 (51 + i.val) ∧
      (entry0297 i).charge = charge 19 (51 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0297 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (51 + i.val)) shift
      (S (51 + i.val + 1)) (S 20) (T 19 (51 + i.val + 1))
      (T 19 (51 + i.val)) (T 20 (51 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0297.entries OriginalRow227TriangleForward0297.checked
    ⟨i.val, by rw [size0297]; exact i.isLt⟩
  change (entry0297 i).check = true at h
  rcases fields0297 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0298 : OriginalRow227TriangleForward0298.entries.size = 32 := rfl

def entry0298 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0298.entries[i.val]'(by rw [size0298]; exact i.isLt)

theorem fields0298 (i : Fin 32) :
    (entry0298 i).IA = shift ∧ (entry0298 i).ID = S (83 + i.val + 1) ∧
      (entry0298 i).IC = S 20 ∧ (entry0298 i).Inext = T 19 (83 + i.val + 1) ∧
      (entry0298 i).Icur = T 19 (83 + i.val) ∧
      (entry0298 i).output = T 20 (83 + i.val) ∧
      (entry0298 i).charge = charge 19 (83 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0298 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (83 + i.val)) shift
      (S (83 + i.val + 1)) (S 20) (T 19 (83 + i.val + 1))
      (T 19 (83 + i.val)) (T 20 (83 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0298.entries OriginalRow227TriangleForward0298.checked
    ⟨i.val, by rw [size0298]; exact i.isLt⟩
  change (entry0298 i).check = true at h
  rcases fields0298 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0299 : OriginalRow227TriangleForward0299.entries.size = 32 := rfl

def entry0299 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0299.entries[i.val]'(by rw [size0299]; exact i.isLt)

theorem fields0299 (i : Fin 32) :
    (entry0299 i).IA = shift ∧ (entry0299 i).ID = S (115 + i.val + 1) ∧
      (entry0299 i).IC = S 20 ∧ (entry0299 i).Inext = T 19 (115 + i.val + 1) ∧
      (entry0299 i).Icur = T 19 (115 + i.val) ∧
      (entry0299 i).output = T 20 (115 + i.val) ∧
      (entry0299 i).charge = charge 19 (115 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0299 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (115 + i.val)) shift
      (S (115 + i.val + 1)) (S 20) (T 19 (115 + i.val + 1))
      (T 19 (115 + i.val)) (T 20 (115 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0299.entries OriginalRow227TriangleForward0299.checked
    ⟨i.val, by rw [size0299]; exact i.isLt⟩
  change (entry0299 i).check = true at h
  rcases fields0299 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0300 : OriginalRow227TriangleForward0300.entries.size = 32 := rfl

def entry0300 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0300.entries[i.val]'(by rw [size0300]; exact i.isLt)

theorem fields0300 (i : Fin 32) :
    (entry0300 i).IA = shift ∧ (entry0300 i).ID = S (147 + i.val + 1) ∧
      (entry0300 i).IC = S 20 ∧ (entry0300 i).Inext = T 19 (147 + i.val + 1) ∧
      (entry0300 i).Icur = T 19 (147 + i.val) ∧
      (entry0300 i).output = T 20 (147 + i.val) ∧
      (entry0300 i).charge = charge 19 (147 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0300 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (147 + i.val)) shift
      (S (147 + i.val + 1)) (S 20) (T 19 (147 + i.val + 1))
      (T 19 (147 + i.val)) (T 20 (147 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0300.entries OriginalRow227TriangleForward0300.checked
    ⟨i.val, by rw [size0300]; exact i.isLt⟩
  change (entry0300 i).check = true at h
  rcases fields0300 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0301 : OriginalRow227TriangleForward0301.entries.size = 32 := rfl

def entry0301 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0301.entries[i.val]'(by rw [size0301]; exact i.isLt)

theorem fields0301 (i : Fin 32) :
    (entry0301 i).IA = shift ∧ (entry0301 i).ID = S (179 + i.val + 1) ∧
      (entry0301 i).IC = S 20 ∧ (entry0301 i).Inext = T 19 (179 + i.val + 1) ∧
      (entry0301 i).Icur = T 19 (179 + i.val) ∧
      (entry0301 i).output = T 20 (179 + i.val) ∧
      (entry0301 i).charge = charge 19 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0301 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 20) (T 19 (179 + i.val + 1))
      (T 19 (179 + i.val)) (T 20 (179 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0301.entries OriginalRow227TriangleForward0301.checked
    ⟨i.val, by rw [size0301]; exact i.isLt⟩
  change (entry0301 i).check = true at h
  rcases fields0301 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0302 : OriginalRow227TriangleForward0302.entries.size = 32 := rfl

def entry0302 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0302.entries[i.val]'(by rw [size0302]; exact i.isLt)

theorem fields0302 (i : Fin 32) :
    (entry0302 i).IA = shift ∧ (entry0302 i).ID = S (211 + i.val + 1) ∧
      (entry0302 i).IC = S 20 ∧ (entry0302 i).Inext = T 19 (211 + i.val + 1) ∧
      (entry0302 i).Icur = T 19 (211 + i.val) ∧
      (entry0302 i).output = T 20 (211 + i.val) ∧
      (entry0302 i).charge = charge 19 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0302 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 20) (T 19 (211 + i.val + 1))
      (T 19 (211 + i.val)) (T 20 (211 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0302.entries OriginalRow227TriangleForward0302.checked
    ⟨i.val, by rw [size0302]; exact i.isLt⟩
  change (entry0302 i).check = true at h
  rcases fields0302 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0303 : OriginalRow227TriangleForward0303.entries.size = 32 := rfl

def entry0303 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0303.entries[i.val]'(by rw [size0303]; exact i.isLt)

theorem fields0303 (i : Fin 32) :
    (entry0303 i).IA = shift ∧ (entry0303 i).ID = S (243 + i.val + 1) ∧
      (entry0303 i).IC = S 20 ∧ (entry0303 i).Inext = T 19 (243 + i.val + 1) ∧
      (entry0303 i).Icur = T 19 (243 + i.val) ∧
      (entry0303 i).output = T 20 (243 + i.val) ∧
      (entry0303 i).charge = charge 19 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0303 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 20) (T 19 (243 + i.val + 1))
      (T 19 (243 + i.val)) (T 20 (243 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0303.entries OriginalRow227TriangleForward0303.checked
    ⟨i.val, by rw [size0303]; exact i.isLt⟩
  change (entry0303 i).check = true at h
  rcases fields0303 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0304 : OriginalRow227TriangleForward0304.entries.size = 32 := rfl

def entry0304 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0304.entries[i.val]'(by rw [size0304]; exact i.isLt)

theorem fields0304 (i : Fin 32) :
    (entry0304 i).IA = shift ∧ (entry0304 i).ID = S (275 + i.val + 1) ∧
      (entry0304 i).IC = S 20 ∧ (entry0304 i).Inext = T 19 (275 + i.val + 1) ∧
      (entry0304 i).Icur = T 19 (275 + i.val) ∧
      (entry0304 i).output = T 20 (275 + i.val) ∧
      (entry0304 i).charge = charge 19 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0304 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 20) (T 19 (275 + i.val + 1))
      (T 19 (275 + i.val)) (T 20 (275 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0304.entries OriginalRow227TriangleForward0304.checked
    ⟨i.val, by rw [size0304]; exact i.isLt⟩
  change (entry0304 i).check = true at h
  rcases fields0304 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0305 : OriginalRow227TriangleForward0305.entries.size = 32 := rfl

def entry0305 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0305.entries[i.val]'(by rw [size0305]; exact i.isLt)

theorem fields0305 (i : Fin 32) :
    (entry0305 i).IA = shift ∧ (entry0305 i).ID = S (307 + i.val + 1) ∧
      (entry0305 i).IC = S 20 ∧ (entry0305 i).Inext = T 19 (307 + i.val + 1) ∧
      (entry0305 i).Icur = T 19 (307 + i.val) ∧
      (entry0305 i).output = T 20 (307 + i.val) ∧
      (entry0305 i).charge = charge 19 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0305 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 20) (T 19 (307 + i.val + 1))
      (T 19 (307 + i.val)) (T 20 (307 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0305.entries OriginalRow227TriangleForward0305.checked
    ⟨i.val, by rw [size0305]; exact i.isLt⟩
  change (entry0305 i).check = true at h
  rcases fields0305 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0306 : OriginalRow227TriangleForward0306.entries.size = 32 := rfl

def entry0306 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0306.entries[i.val]'(by rw [size0306]; exact i.isLt)

theorem fields0306 (i : Fin 32) :
    (entry0306 i).IA = shift ∧ (entry0306 i).ID = S (339 + i.val + 1) ∧
      (entry0306 i).IC = S 20 ∧ (entry0306 i).Inext = T 19 (339 + i.val + 1) ∧
      (entry0306 i).Icur = T 19 (339 + i.val) ∧
      (entry0306 i).output = T 20 (339 + i.val) ∧
      (entry0306 i).charge = charge 19 (339 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0306 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (339 + i.val)) shift
      (S (339 + i.val + 1)) (S 20) (T 19 (339 + i.val + 1))
      (T 19 (339 + i.val)) (T 20 (339 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0306.entries OriginalRow227TriangleForward0306.checked
    ⟨i.val, by rw [size0306]; exact i.isLt⟩
  change (entry0306 i).check = true at h
  rcases fields0306 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0307 : OriginalRow227TriangleForward0307.entries.size = 32 := rfl

def entry0307 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0307.entries[i.val]'(by rw [size0307]; exact i.isLt)

theorem fields0307 (i : Fin 32) :
    (entry0307 i).IA = shift ∧ (entry0307 i).ID = S (371 + i.val + 1) ∧
      (entry0307 i).IC = S 20 ∧ (entry0307 i).Inext = T 19 (371 + i.val + 1) ∧
      (entry0307 i).Icur = T 19 (371 + i.val) ∧
      (entry0307 i).output = T 20 (371 + i.val) ∧
      (entry0307 i).charge = charge 19 (371 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0307 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (371 + i.val)) shift
      (S (371 + i.val + 1)) (S 20) (T 19 (371 + i.val + 1))
      (T 19 (371 + i.val)) (T 20 (371 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0307.entries OriginalRow227TriangleForward0307.checked
    ⟨i.val, by rw [size0307]; exact i.isLt⟩
  change (entry0307 i).check = true at h
  rcases fields0307 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0308 : OriginalRow227TriangleForward0308.entries.size = 32 := rfl

def entry0308 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0308.entries[i.val]'(by rw [size0308]; exact i.isLt)

theorem fields0308 (i : Fin 32) :
    (entry0308 i).IA = shift ∧ (entry0308 i).ID = S (403 + i.val + 1) ∧
      (entry0308 i).IC = S 20 ∧ (entry0308 i).Inext = T 19 (403 + i.val + 1) ∧
      (entry0308 i).Icur = T 19 (403 + i.val) ∧
      (entry0308 i).output = T 20 (403 + i.val) ∧
      (entry0308 i).charge = charge 19 (403 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0308 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (403 + i.val)) shift
      (S (403 + i.val + 1)) (S 20) (T 19 (403 + i.val + 1))
      (T 19 (403 + i.val)) (T 20 (403 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0308.entries OriginalRow227TriangleForward0308.checked
    ⟨i.val, by rw [size0308]; exact i.isLt⟩
  change (entry0308 i).check = true at h
  rcases fields0308 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0309 : OriginalRow227TriangleForward0309.entries.size = 32 := rfl

def entry0309 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0309.entries[i.val]'(by rw [size0309]; exact i.isLt)

theorem fields0309 (i : Fin 32) :
    (entry0309 i).IA = shift ∧ (entry0309 i).ID = S (435 + i.val + 1) ∧
      (entry0309 i).IC = S 20 ∧ (entry0309 i).Inext = T 19 (435 + i.val + 1) ∧
      (entry0309 i).Icur = T 19 (435 + i.val) ∧
      (entry0309 i).output = T 20 (435 + i.val) ∧
      (entry0309 i).charge = charge 19 (435 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0309 (i : Fin 32) :
    forwardStepOK (-768) (charge 19 (435 + i.val)) shift
      (S (435 + i.val + 1)) (S 20) (T 19 (435 + i.val + 1))
      (T 19 (435 + i.val)) (T 20 (435 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0309.entries OriginalRow227TriangleForward0309.checked
    ⟨i.val, by rw [size0309]; exact i.isLt⟩
  change (entry0309 i).check = true at h
  rcases fields0309 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0310 : OriginalRow227TriangleForward0310.entries.size = 15 := rfl

def entry0310 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0310.entries[i.val]'(by rw [size0310]; exact i.isLt)

theorem fields0310 (i : Fin 15) :
    (entry0310 i).IA = shift ∧ (entry0310 i).ID = S (467 + i.val + 1) ∧
      (entry0310 i).IC = S 20 ∧ (entry0310 i).Inext = T 19 (467 + i.val + 1) ∧
      (entry0310 i).Icur = T 19 (467 + i.val) ∧
      (entry0310 i).output = T 20 (467 + i.val) ∧
      (entry0310 i).charge = charge 19 (467 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨14, by decide⟩).symm, rfl⟩

theorem step0310 (i : Fin 15) :
    forwardStepOK (-768) (charge 19 (467 + i.val)) shift
      (S (467 + i.val + 1)) (S 20) (T 19 (467 + i.val + 1))
      (T 19 (467 + i.val)) (T 20 (467 + i.val))
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0310.entries OriginalRow227TriangleForward0310.checked
    ⟨i.val, by rw [size0310]; exact i.isLt⟩
  change (entry0310 i).check = true at h
  rcases fields0310 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 19 ≤ d) (hhi : d < 482) :
    forwardStepOK (-768) (charge 19 d) shift (S (d + 1)) (S 20)
      (T 19 (d + 1)) (T 19 d) (T 20 d)
      (OriginalRow227Roots.root_pos 20 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 19 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h115 : d < 115
    ·
      by_cases h51 : d < 51
      ·
        have hi : d - 19 < 32 := by omega
        have heq : 19 + (d - 19) = d := by omega
        simpa only [heq] using step0296 ⟨d - 19, hi⟩
      ·
        by_cases h83 : d < 83
        ·
          have hi : d - 51 < 32 := by omega
          have heq : 51 + (d - 51) = d := by omega
          simpa only [heq] using step0297 ⟨d - 51, hi⟩
        ·
          have hi : d - 83 < 32 := by omega
          have heq : 83 + (d - 83) = d := by omega
          simpa only [heq] using step0298 ⟨d - 83, hi⟩
    ·
      by_cases h179 : d < 179
      ·
        by_cases h147 : d < 147
        ·
          have hi : d - 115 < 32 := by omega
          have heq : 115 + (d - 115) = d := by omega
          simpa only [heq] using step0299 ⟨d - 115, hi⟩
        ·
          have hi : d - 147 < 32 := by omega
          have heq : 147 + (d - 147) = d := by omega
          simpa only [heq] using step0300 ⟨d - 147, hi⟩
      ·
        by_cases h211 : d < 211
        ·
          have hi : d - 179 < 32 := by omega
          have heq : 179 + (d - 179) = d := by omega
          simpa only [heq] using step0301 ⟨d - 179, hi⟩
        ·
          have hi : d - 211 < 32 := by omega
          have heq : 211 + (d - 211) = d := by omega
          simpa only [heq] using step0302 ⟨d - 211, hi⟩
  ·
    by_cases h371 : d < 371
    ·
      by_cases h307 : d < 307
      ·
        by_cases h275 : d < 275
        ·
          have hi : d - 243 < 32 := by omega
          have heq : 243 + (d - 243) = d := by omega
          simpa only [heq] using step0303 ⟨d - 243, hi⟩
        ·
          have hi : d - 275 < 32 := by omega
          have heq : 275 + (d - 275) = d := by omega
          simpa only [heq] using step0304 ⟨d - 275, hi⟩
      ·
        by_cases h339 : d < 339
        ·
          have hi : d - 307 < 32 := by omega
          have heq : 307 + (d - 307) = d := by omega
          simpa only [heq] using step0305 ⟨d - 307, hi⟩
        ·
          have hi : d - 339 < 32 := by omega
          have heq : 339 + (d - 339) = d := by omega
          simpa only [heq] using step0306 ⟨d - 339, hi⟩
    ·
      by_cases h435 : d < 435
      ·
        by_cases h403 : d < 403
        ·
          have hi : d - 371 < 32 := by omega
          have heq : 371 + (d - 371) = d := by omega
          simpa only [heq] using step0307 ⟨d - 371, hi⟩
        ·
          have hi : d - 403 < 32 := by omega
          have heq : 403 + (d - 403) = d := by omega
          simpa only [heq] using step0308 ⟨d - 403, hi⟩
      ·
        by_cases h467 : d < 467
        ·
          have hi : d - 435 < 32 := by omega
          have heq : 435 + (d - 435) = d := by omega
          simpa only [heq] using step0309 ⟨d - 435, hi⟩
        ·
          have hi : d - 467 < 15 := by omega
          have heq : 467 + (d - 467) = d := by omega
          simpa only [heq] using step0310 ⟨d - 467, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0296,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0296,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0297,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0297,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0298,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0298,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0299,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0299,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0300,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0300,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0301,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0301,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0302,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0302,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0303,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0303,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0304,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0304,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0305,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0305,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0306,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0306,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0307,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0307,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0308,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0308,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0309,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0309,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.fields0310,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.step0310,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow020
