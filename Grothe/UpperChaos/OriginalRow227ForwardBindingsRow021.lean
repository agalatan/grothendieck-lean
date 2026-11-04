import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021
import Grothe.UpperChaos.OriginalRow227TriangleForward0311
import Grothe.UpperChaos.OriginalRow227TriangleForward0312
import Grothe.UpperChaos.OriginalRow227TriangleForward0313
import Grothe.UpperChaos.OriginalRow227TriangleForward0314
import Grothe.UpperChaos.OriginalRow227TriangleForward0315
import Grothe.UpperChaos.OriginalRow227TriangleForward0316
import Grothe.UpperChaos.OriginalRow227TriangleForward0317
import Grothe.UpperChaos.OriginalRow227TriangleForward0318
import Grothe.UpperChaos.OriginalRow227TriangleForward0319
import Grothe.UpperChaos.OriginalRow227TriangleForward0320
import Grothe.UpperChaos.OriginalRow227TriangleForward0321
import Grothe.UpperChaos.OriginalRow227TriangleForward0322
import Grothe.UpperChaos.OriginalRow227TriangleForward0323
import Grothe.UpperChaos.OriginalRow227TriangleForward0324
import Grothe.UpperChaos.OriginalRow227TriangleForward0325

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0311 : OriginalRow227TriangleForward0311.entries.size = 32 := rfl

def entry0311 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0311.entries[i.val]'(by rw [size0311]; exact i.isLt)

theorem fields0311 (i : Fin 32) :
    (entry0311 i).IA = shift ∧ (entry0311 i).ID = S (20 + i.val + 1) ∧
      (entry0311 i).IC = S 21 ∧ (entry0311 i).Inext = T 20 (20 + i.val + 1) ∧
      (entry0311 i).Icur = T 20 (20 + i.val) ∧
      (entry0311 i).output = T 21 (20 + i.val) ∧
      (entry0311 i).charge = charge 20 (20 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0312_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0327_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0311 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (20 + i.val)) shift
      (S (20 + i.val + 1)) (S 21) (T 20 (20 + i.val + 1))
      (T 20 (20 + i.val)) (T 21 (20 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0311.entries OriginalRow227TriangleForward0311.checked
    ⟨i.val, by rw [size0311]; exact i.isLt⟩
  change (entry0311 i).check = true at h
  rcases fields0311 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0312 : OriginalRow227TriangleForward0312.entries.size = 32 := rfl

def entry0312 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0312.entries[i.val]'(by rw [size0312]; exact i.isLt)

theorem fields0312 (i : Fin 32) :
    (entry0312 i).IA = shift ∧ (entry0312 i).ID = S (52 + i.val + 1) ∧
      (entry0312 i).IC = S 21 ∧ (entry0312 i).Inext = T 20 (52 + i.val + 1) ∧
      (entry0312 i).Icur = T 20 (52 + i.val) ∧
      (entry0312 i).output = T 21 (52 + i.val) ∧
      (entry0312 i).charge = charge 20 (52 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0313_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0328_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0312 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (52 + i.val)) shift
      (S (52 + i.val + 1)) (S 21) (T 20 (52 + i.val + 1))
      (T 20 (52 + i.val)) (T 21 (52 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0312.entries OriginalRow227TriangleForward0312.checked
    ⟨i.val, by rw [size0312]; exact i.isLt⟩
  change (entry0312 i).check = true at h
  rcases fields0312 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0313 : OriginalRow227TriangleForward0313.entries.size = 32 := rfl

def entry0313 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0313.entries[i.val]'(by rw [size0313]; exact i.isLt)

theorem fields0313 (i : Fin 32) :
    (entry0313 i).IA = shift ∧ (entry0313 i).ID = S (84 + i.val + 1) ∧
      (entry0313 i).IC = S 21 ∧ (entry0313 i).Inext = T 20 (84 + i.val + 1) ∧
      (entry0313 i).Icur = T 20 (84 + i.val) ∧
      (entry0313 i).output = T 21 (84 + i.val) ∧
      (entry0313 i).charge = charge 20 (84 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0314_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0329_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0313 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (84 + i.val)) shift
      (S (84 + i.val + 1)) (S 21) (T 20 (84 + i.val + 1))
      (T 20 (84 + i.val)) (T 21 (84 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0313.entries OriginalRow227TriangleForward0313.checked
    ⟨i.val, by rw [size0313]; exact i.isLt⟩
  change (entry0313 i).check = true at h
  rcases fields0313 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0314 : OriginalRow227TriangleForward0314.entries.size = 32 := rfl

def entry0314 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0314.entries[i.val]'(by rw [size0314]; exact i.isLt)

theorem fields0314 (i : Fin 32) :
    (entry0314 i).IA = shift ∧ (entry0314 i).ID = S (116 + i.val + 1) ∧
      (entry0314 i).IC = S 21 ∧ (entry0314 i).Inext = T 20 (116 + i.val + 1) ∧
      (entry0314 i).Icur = T 20 (116 + i.val) ∧
      (entry0314 i).output = T 21 (116 + i.val) ∧
      (entry0314 i).charge = charge 20 (116 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0315_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0330_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0314 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (116 + i.val)) shift
      (S (116 + i.val + 1)) (S 21) (T 20 (116 + i.val + 1))
      (T 20 (116 + i.val)) (T 21 (116 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0314.entries OriginalRow227TriangleForward0314.checked
    ⟨i.val, by rw [size0314]; exact i.isLt⟩
  change (entry0314 i).check = true at h
  rcases fields0314 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0315 : OriginalRow227TriangleForward0315.entries.size = 32 := rfl

def entry0315 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0315.entries[i.val]'(by rw [size0315]; exact i.isLt)

theorem fields0315 (i : Fin 32) :
    (entry0315 i).IA = shift ∧ (entry0315 i).ID = S (148 + i.val + 1) ∧
      (entry0315 i).IC = S 21 ∧ (entry0315 i).Inext = T 20 (148 + i.val + 1) ∧
      (entry0315 i).Icur = T 20 (148 + i.val) ∧
      (entry0315 i).output = T 21 (148 + i.val) ∧
      (entry0315 i).charge = charge 20 (148 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0316_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0331_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0315 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (148 + i.val)) shift
      (S (148 + i.val + 1)) (S 21) (T 20 (148 + i.val + 1))
      (T 20 (148 + i.val)) (T 21 (148 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0315.entries OriginalRow227TriangleForward0315.checked
    ⟨i.val, by rw [size0315]; exact i.isLt⟩
  change (entry0315 i).check = true at h
  rcases fields0315 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0316 : OriginalRow227TriangleForward0316.entries.size = 32 := rfl

def entry0316 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0316.entries[i.val]'(by rw [size0316]; exact i.isLt)

theorem fields0316 (i : Fin 32) :
    (entry0316 i).IA = shift ∧ (entry0316 i).ID = S (180 + i.val + 1) ∧
      (entry0316 i).IC = S 21 ∧ (entry0316 i).Inext = T 20 (180 + i.val + 1) ∧
      (entry0316 i).Icur = T 20 (180 + i.val) ∧
      (entry0316 i).output = T 21 (180 + i.val) ∧
      (entry0316 i).charge = charge 20 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0317_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0332_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0316 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 21) (T 20 (180 + i.val + 1))
      (T 20 (180 + i.val)) (T 21 (180 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0316.entries OriginalRow227TriangleForward0316.checked
    ⟨i.val, by rw [size0316]; exact i.isLt⟩
  change (entry0316 i).check = true at h
  rcases fields0316 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0317 : OriginalRow227TriangleForward0317.entries.size = 32 := rfl

def entry0317 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0317.entries[i.val]'(by rw [size0317]; exact i.isLt)

theorem fields0317 (i : Fin 32) :
    (entry0317 i).IA = shift ∧ (entry0317 i).ID = S (212 + i.val + 1) ∧
      (entry0317 i).IC = S 21 ∧ (entry0317 i).Inext = T 20 (212 + i.val + 1) ∧
      (entry0317 i).Icur = T 20 (212 + i.val) ∧
      (entry0317 i).output = T 21 (212 + i.val) ∧
      (entry0317 i).charge = charge 20 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0318_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0333_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0317 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 21) (T 20 (212 + i.val + 1))
      (T 20 (212 + i.val)) (T 21 (212 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0317.entries OriginalRow227TriangleForward0317.checked
    ⟨i.val, by rw [size0317]; exact i.isLt⟩
  change (entry0317 i).check = true at h
  rcases fields0317 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0318 : OriginalRow227TriangleForward0318.entries.size = 32 := rfl

def entry0318 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0318.entries[i.val]'(by rw [size0318]; exact i.isLt)

theorem fields0318 (i : Fin 32) :
    (entry0318 i).IA = shift ∧ (entry0318 i).ID = S (244 + i.val + 1) ∧
      (entry0318 i).IC = S 21 ∧ (entry0318 i).Inext = T 20 (244 + i.val + 1) ∧
      (entry0318 i).Icur = T 20 (244 + i.val) ∧
      (entry0318 i).output = T 21 (244 + i.val) ∧
      (entry0318 i).charge = charge 20 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0319_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0334_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0318 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 21) (T 20 (244 + i.val + 1))
      (T 20 (244 + i.val)) (T 21 (244 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0318.entries OriginalRow227TriangleForward0318.checked
    ⟨i.val, by rw [size0318]; exact i.isLt⟩
  change (entry0318 i).check = true at h
  rcases fields0318 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0319 : OriginalRow227TriangleForward0319.entries.size = 32 := rfl

def entry0319 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0319.entries[i.val]'(by rw [size0319]; exact i.isLt)

theorem fields0319 (i : Fin 32) :
    (entry0319 i).IA = shift ∧ (entry0319 i).ID = S (276 + i.val + 1) ∧
      (entry0319 i).IC = S 21 ∧ (entry0319 i).Inext = T 20 (276 + i.val + 1) ∧
      (entry0319 i).Icur = T 20 (276 + i.val) ∧
      (entry0319 i).output = T 21 (276 + i.val) ∧
      (entry0319 i).charge = charge 20 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0320_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0335_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0319 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 21) (T 20 (276 + i.val + 1))
      (T 20 (276 + i.val)) (T 21 (276 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0319.entries OriginalRow227TriangleForward0319.checked
    ⟨i.val, by rw [size0319]; exact i.isLt⟩
  change (entry0319 i).check = true at h
  rcases fields0319 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0320 : OriginalRow227TriangleForward0320.entries.size = 32 := rfl

def entry0320 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0320.entries[i.val]'(by rw [size0320]; exact i.isLt)

theorem fields0320 (i : Fin 32) :
    (entry0320 i).IA = shift ∧ (entry0320 i).ID = S (308 + i.val + 1) ∧
      (entry0320 i).IC = S 21 ∧ (entry0320 i).Inext = T 20 (308 + i.val + 1) ∧
      (entry0320 i).Icur = T 20 (308 + i.val) ∧
      (entry0320 i).output = T 21 (308 + i.val) ∧
      (entry0320 i).charge = charge 20 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0321_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0336_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0320 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 21) (T 20 (308 + i.val + 1))
      (T 20 (308 + i.val)) (T 21 (308 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0320.entries OriginalRow227TriangleForward0320.checked
    ⟨i.val, by rw [size0320]; exact i.isLt⟩
  change (entry0320 i).check = true at h
  rcases fields0320 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0321 : OriginalRow227TriangleForward0321.entries.size = 32 := rfl

def entry0321 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0321.entries[i.val]'(by rw [size0321]; exact i.isLt)

theorem fields0321 (i : Fin 32) :
    (entry0321 i).IA = shift ∧ (entry0321 i).ID = S (340 + i.val + 1) ∧
      (entry0321 i).IC = S 21 ∧ (entry0321 i).Inext = T 20 (340 + i.val + 1) ∧
      (entry0321 i).Icur = T 20 (340 + i.val) ∧
      (entry0321 i).output = T 21 (340 + i.val) ∧
      (entry0321 i).charge = charge 20 (340 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0322_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0337_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0321 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (340 + i.val)) shift
      (S (340 + i.val + 1)) (S 21) (T 20 (340 + i.val + 1))
      (T 20 (340 + i.val)) (T 21 (340 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0321.entries OriginalRow227TriangleForward0321.checked
    ⟨i.val, by rw [size0321]; exact i.isLt⟩
  change (entry0321 i).check = true at h
  rcases fields0321 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0322 : OriginalRow227TriangleForward0322.entries.size = 32 := rfl

def entry0322 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0322.entries[i.val]'(by rw [size0322]; exact i.isLt)

theorem fields0322 (i : Fin 32) :
    (entry0322 i).IA = shift ∧ (entry0322 i).ID = S (372 + i.val + 1) ∧
      (entry0322 i).IC = S 21 ∧ (entry0322 i).Inext = T 20 (372 + i.val + 1) ∧
      (entry0322 i).Icur = T 20 (372 + i.val) ∧
      (entry0322 i).output = T 21 (372 + i.val) ∧
      (entry0322 i).charge = charge 20 (372 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0323_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0338_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0322 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (372 + i.val)) shift
      (S (372 + i.val + 1)) (S 21) (T 20 (372 + i.val + 1))
      (T 20 (372 + i.val)) (T 21 (372 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0322.entries OriginalRow227TriangleForward0322.checked
    ⟨i.val, by rw [size0322]; exact i.isLt⟩
  change (entry0322 i).check = true at h
  rcases fields0322 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0323 : OriginalRow227TriangleForward0323.entries.size = 32 := rfl

def entry0323 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0323.entries[i.val]'(by rw [size0323]; exact i.isLt)

theorem fields0323 (i : Fin 32) :
    (entry0323 i).IA = shift ∧ (entry0323 i).ID = S (404 + i.val + 1) ∧
      (entry0323 i).IC = S 21 ∧ (entry0323 i).Inext = T 20 (404 + i.val + 1) ∧
      (entry0323 i).Icur = T 20 (404 + i.val) ∧
      (entry0323 i).output = T 21 (404 + i.val) ∧
      (entry0323 i).charge = charge 20 (404 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0324_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0339_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0323 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (404 + i.val)) shift
      (S (404 + i.val + 1)) (S 21) (T 20 (404 + i.val + 1))
      (T 20 (404 + i.val)) (T 21 (404 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0323.entries OriginalRow227TriangleForward0323.checked
    ⟨i.val, by rw [size0323]; exact i.isLt⟩
  change (entry0323 i).check = true at h
  rcases fields0323 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0324 : OriginalRow227TriangleForward0324.entries.size = 32 := rfl

def entry0324 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0324.entries[i.val]'(by rw [size0324]; exact i.isLt)

theorem fields0324 (i : Fin 32) :
    (entry0324 i).IA = shift ∧ (entry0324 i).ID = S (436 + i.val + 1) ∧
      (entry0324 i).IC = S 21 ∧ (entry0324 i).Inext = T 20 (436 + i.val + 1) ∧
      (entry0324 i).Icur = T 20 (436 + i.val) ∧
      (entry0324 i).output = T 21 (436 + i.val) ∧
      (entry0324 i).charge = charge 20 (436 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0325_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0340_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0324 (i : Fin 32) :
    forwardStepOK (-768) (charge 20 (436 + i.val)) shift
      (S (436 + i.val + 1)) (S 21) (T 20 (436 + i.val + 1))
      (T 20 (436 + i.val)) (T 21 (436 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0324.entries OriginalRow227TriangleForward0324.checked
    ⟨i.val, by rw [size0324]; exact i.isLt⟩
  change (entry0324 i).check = true at h
  rcases fields0324 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0325 : OriginalRow227TriangleForward0325.entries.size = 13 := rfl

def entry0325 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0325.entries[i.val]'(by rw [size0325]; exact i.isLt)

theorem fields0325 (i : Fin 13) :
    (entry0325 i).IA = shift ∧ (entry0325 i).ID = S (468 + i.val + 1) ∧
      (entry0325 i).IC = S 21 ∧ (entry0325 i).Inext = T 20 (468 + i.val + 1) ∧
      (entry0325 i).Icur = T 20 (468 + i.val) ∧
      (entry0325 i).output = T 21 (468 + i.val) ∧
      (entry0325 i).charge = charge 20 (468 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow020.block0326_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow021.block0341_value ⟨12, by decide⟩).symm, rfl⟩

theorem step0325 (i : Fin 13) :
    forwardStepOK (-768) (charge 20 (468 + i.val)) shift
      (S (468 + i.val + 1)) (S 21) (T 20 (468 + i.val + 1))
      (T 20 (468 + i.val)) (T 21 (468 + i.val))
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0325.entries OriginalRow227TriangleForward0325.checked
    ⟨i.val, by rw [size0325]; exact i.isLt⟩
  change (entry0325 i).check = true at h
  rcases fields0325 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 20 ≤ d) (hhi : d < 481) :
    forwardStepOK (-768) (charge 20 d) shift (S (d + 1)) (S 21)
      (T 20 (d + 1)) (T 20 d) (T 21 d)
      (OriginalRow227Roots.root_pos 21 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 20 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h116 : d < 116
    ·
      by_cases h52 : d < 52
      ·
        have hi : d - 20 < 32 := by omega
        have heq : 20 + (d - 20) = d := by omega
        simpa only [heq] using step0311 ⟨d - 20, hi⟩
      ·
        by_cases h84 : d < 84
        ·
          have hi : d - 52 < 32 := by omega
          have heq : 52 + (d - 52) = d := by omega
          simpa only [heq] using step0312 ⟨d - 52, hi⟩
        ·
          have hi : d - 84 < 32 := by omega
          have heq : 84 + (d - 84) = d := by omega
          simpa only [heq] using step0313 ⟨d - 84, hi⟩
    ·
      by_cases h180 : d < 180
      ·
        by_cases h148 : d < 148
        ·
          have hi : d - 116 < 32 := by omega
          have heq : 116 + (d - 116) = d := by omega
          simpa only [heq] using step0314 ⟨d - 116, hi⟩
        ·
          have hi : d - 148 < 32 := by omega
          have heq : 148 + (d - 148) = d := by omega
          simpa only [heq] using step0315 ⟨d - 148, hi⟩
      ·
        by_cases h212 : d < 212
        ·
          have hi : d - 180 < 32 := by omega
          have heq : 180 + (d - 180) = d := by omega
          simpa only [heq] using step0316 ⟨d - 180, hi⟩
        ·
          have hi : d - 212 < 32 := by omega
          have heq : 212 + (d - 212) = d := by omega
          simpa only [heq] using step0317 ⟨d - 212, hi⟩
  ·
    by_cases h372 : d < 372
    ·
      by_cases h308 : d < 308
      ·
        by_cases h276 : d < 276
        ·
          have hi : d - 244 < 32 := by omega
          have heq : 244 + (d - 244) = d := by omega
          simpa only [heq] using step0318 ⟨d - 244, hi⟩
        ·
          have hi : d - 276 < 32 := by omega
          have heq : 276 + (d - 276) = d := by omega
          simpa only [heq] using step0319 ⟨d - 276, hi⟩
      ·
        by_cases h340 : d < 340
        ·
          have hi : d - 308 < 32 := by omega
          have heq : 308 + (d - 308) = d := by omega
          simpa only [heq] using step0320 ⟨d - 308, hi⟩
        ·
          have hi : d - 340 < 32 := by omega
          have heq : 340 + (d - 340) = d := by omega
          simpa only [heq] using step0321 ⟨d - 340, hi⟩
    ·
      by_cases h436 : d < 436
      ·
        by_cases h404 : d < 404
        ·
          have hi : d - 372 < 32 := by omega
          have heq : 372 + (d - 372) = d := by omega
          simpa only [heq] using step0322 ⟨d - 372, hi⟩
        ·
          have hi : d - 404 < 32 := by omega
          have heq : 404 + (d - 404) = d := by omega
          simpa only [heq] using step0323 ⟨d - 404, hi⟩
      ·
        by_cases h468 : d < 468
        ·
          have hi : d - 436 < 32 := by omega
          have heq : 436 + (d - 436) = d := by omega
          simpa only [heq] using step0324 ⟨d - 436, hi⟩
        ·
          have hi : d - 468 < 13 := by omega
          have heq : 468 + (d - 468) = d := by omega
          simpa only [heq] using step0325 ⟨d - 468, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0311,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0311,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0312,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0312,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0313,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0313,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0314,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0314,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0315,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0315,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0316,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0316,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0317,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0317,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0318,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0318,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0319,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0319,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0320,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0320,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0321,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0321,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0322,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0322,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0323,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0323,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0324,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0324,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.fields0325,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.step0325,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow021
