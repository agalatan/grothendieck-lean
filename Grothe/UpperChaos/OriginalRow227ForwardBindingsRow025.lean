import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025
import Grothe.UpperChaos.OriginalRow227TriangleForward0371
import Grothe.UpperChaos.OriginalRow227TriangleForward0372
import Grothe.UpperChaos.OriginalRow227TriangleForward0373
import Grothe.UpperChaos.OriginalRow227TriangleForward0374
import Grothe.UpperChaos.OriginalRow227TriangleForward0375
import Grothe.UpperChaos.OriginalRow227TriangleForward0376
import Grothe.UpperChaos.OriginalRow227TriangleForward0377
import Grothe.UpperChaos.OriginalRow227TriangleForward0378
import Grothe.UpperChaos.OriginalRow227TriangleForward0379
import Grothe.UpperChaos.OriginalRow227TriangleForward0380
import Grothe.UpperChaos.OriginalRow227TriangleForward0381
import Grothe.UpperChaos.OriginalRow227TriangleForward0382
import Grothe.UpperChaos.OriginalRow227TriangleForward0383
import Grothe.UpperChaos.OriginalRow227TriangleForward0384
import Grothe.UpperChaos.OriginalRow227TriangleForward0385

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0371 : OriginalRow227TriangleForward0371.entries.size = 32 := rfl

def entry0371 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0371.entries[i.val]'(by rw [size0371]; exact i.isLt)

theorem fields0371 (i : Fin 32) :
    (entry0371 i).IA = shift ∧ (entry0371 i).ID = S (24 + i.val + 1) ∧
      (entry0371 i).IC = S 25 ∧ (entry0371 i).Inext = T 24 (24 + i.val + 1) ∧
      (entry0371 i).Icur = T 24 (24 + i.val) ∧
      (entry0371 i).output = T 25 (24 + i.val) ∧
      (entry0371 i).charge = charge 24 (24 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0371 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (24 + i.val)) shift
      (S (24 + i.val + 1)) (S 25) (T 24 (24 + i.val + 1))
      (T 24 (24 + i.val)) (T 25 (24 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0371.entries OriginalRow227TriangleForward0371.checked
    ⟨i.val, by rw [size0371]; exact i.isLt⟩
  change (entry0371 i).check = true at h
  rcases fields0371 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0372 : OriginalRow227TriangleForward0372.entries.size = 32 := rfl

def entry0372 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0372.entries[i.val]'(by rw [size0372]; exact i.isLt)

theorem fields0372 (i : Fin 32) :
    (entry0372 i).IA = shift ∧ (entry0372 i).ID = S (56 + i.val + 1) ∧
      (entry0372 i).IC = S 25 ∧ (entry0372 i).Inext = T 24 (56 + i.val + 1) ∧
      (entry0372 i).Icur = T 24 (56 + i.val) ∧
      (entry0372 i).output = T 25 (56 + i.val) ∧
      (entry0372 i).charge = charge 24 (56 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0372 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (56 + i.val)) shift
      (S (56 + i.val + 1)) (S 25) (T 24 (56 + i.val + 1))
      (T 24 (56 + i.val)) (T 25 (56 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0372.entries OriginalRow227TriangleForward0372.checked
    ⟨i.val, by rw [size0372]; exact i.isLt⟩
  change (entry0372 i).check = true at h
  rcases fields0372 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0373 : OriginalRow227TriangleForward0373.entries.size = 32 := rfl

def entry0373 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0373.entries[i.val]'(by rw [size0373]; exact i.isLt)

theorem fields0373 (i : Fin 32) :
    (entry0373 i).IA = shift ∧ (entry0373 i).ID = S (88 + i.val + 1) ∧
      (entry0373 i).IC = S 25 ∧ (entry0373 i).Inext = T 24 (88 + i.val + 1) ∧
      (entry0373 i).Icur = T 24 (88 + i.val) ∧
      (entry0373 i).output = T 25 (88 + i.val) ∧
      (entry0373 i).charge = charge 24 (88 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0373 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (88 + i.val)) shift
      (S (88 + i.val + 1)) (S 25) (T 24 (88 + i.val + 1))
      (T 24 (88 + i.val)) (T 25 (88 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0373.entries OriginalRow227TriangleForward0373.checked
    ⟨i.val, by rw [size0373]; exact i.isLt⟩
  change (entry0373 i).check = true at h
  rcases fields0373 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0374 : OriginalRow227TriangleForward0374.entries.size = 32 := rfl

def entry0374 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0374.entries[i.val]'(by rw [size0374]; exact i.isLt)

theorem fields0374 (i : Fin 32) :
    (entry0374 i).IA = shift ∧ (entry0374 i).ID = S (120 + i.val + 1) ∧
      (entry0374 i).IC = S 25 ∧ (entry0374 i).Inext = T 24 (120 + i.val + 1) ∧
      (entry0374 i).Icur = T 24 (120 + i.val) ∧
      (entry0374 i).output = T 25 (120 + i.val) ∧
      (entry0374 i).charge = charge 24 (120 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0374 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (120 + i.val)) shift
      (S (120 + i.val + 1)) (S 25) (T 24 (120 + i.val + 1))
      (T 24 (120 + i.val)) (T 25 (120 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0374.entries OriginalRow227TriangleForward0374.checked
    ⟨i.val, by rw [size0374]; exact i.isLt⟩
  change (entry0374 i).check = true at h
  rcases fields0374 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0375 : OriginalRow227TriangleForward0375.entries.size = 32 := rfl

def entry0375 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0375.entries[i.val]'(by rw [size0375]; exact i.isLt)

theorem fields0375 (i : Fin 32) :
    (entry0375 i).IA = shift ∧ (entry0375 i).ID = S (152 + i.val + 1) ∧
      (entry0375 i).IC = S 25 ∧ (entry0375 i).Inext = T 24 (152 + i.val + 1) ∧
      (entry0375 i).Icur = T 24 (152 + i.val) ∧
      (entry0375 i).output = T 25 (152 + i.val) ∧
      (entry0375 i).charge = charge 24 (152 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0375 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (152 + i.val)) shift
      (S (152 + i.val + 1)) (S 25) (T 24 (152 + i.val + 1))
      (T 24 (152 + i.val)) (T 25 (152 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0375.entries OriginalRow227TriangleForward0375.checked
    ⟨i.val, by rw [size0375]; exact i.isLt⟩
  change (entry0375 i).check = true at h
  rcases fields0375 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0376 : OriginalRow227TriangleForward0376.entries.size = 32 := rfl

def entry0376 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0376.entries[i.val]'(by rw [size0376]; exact i.isLt)

theorem fields0376 (i : Fin 32) :
    (entry0376 i).IA = shift ∧ (entry0376 i).ID = S (184 + i.val + 1) ∧
      (entry0376 i).IC = S 25 ∧ (entry0376 i).Inext = T 24 (184 + i.val + 1) ∧
      (entry0376 i).Icur = T 24 (184 + i.val) ∧
      (entry0376 i).output = T 25 (184 + i.val) ∧
      (entry0376 i).charge = charge 24 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0376 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 25) (T 24 (184 + i.val + 1))
      (T 24 (184 + i.val)) (T 25 (184 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0376.entries OriginalRow227TriangleForward0376.checked
    ⟨i.val, by rw [size0376]; exact i.isLt⟩
  change (entry0376 i).check = true at h
  rcases fields0376 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0377 : OriginalRow227TriangleForward0377.entries.size = 32 := rfl

def entry0377 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0377.entries[i.val]'(by rw [size0377]; exact i.isLt)

theorem fields0377 (i : Fin 32) :
    (entry0377 i).IA = shift ∧ (entry0377 i).ID = S (216 + i.val + 1) ∧
      (entry0377 i).IC = S 25 ∧ (entry0377 i).Inext = T 24 (216 + i.val + 1) ∧
      (entry0377 i).Icur = T 24 (216 + i.val) ∧
      (entry0377 i).output = T 25 (216 + i.val) ∧
      (entry0377 i).charge = charge 24 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0377 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 25) (T 24 (216 + i.val + 1))
      (T 24 (216 + i.val)) (T 25 (216 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0377.entries OriginalRow227TriangleForward0377.checked
    ⟨i.val, by rw [size0377]; exact i.isLt⟩
  change (entry0377 i).check = true at h
  rcases fields0377 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0378 : OriginalRow227TriangleForward0378.entries.size = 32 := rfl

def entry0378 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0378.entries[i.val]'(by rw [size0378]; exact i.isLt)

theorem fields0378 (i : Fin 32) :
    (entry0378 i).IA = shift ∧ (entry0378 i).ID = S (248 + i.val + 1) ∧
      (entry0378 i).IC = S 25 ∧ (entry0378 i).Inext = T 24 (248 + i.val + 1) ∧
      (entry0378 i).Icur = T 24 (248 + i.val) ∧
      (entry0378 i).output = T 25 (248 + i.val) ∧
      (entry0378 i).charge = charge 24 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0378 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 25) (T 24 (248 + i.val + 1))
      (T 24 (248 + i.val)) (T 25 (248 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0378.entries OriginalRow227TriangleForward0378.checked
    ⟨i.val, by rw [size0378]; exact i.isLt⟩
  change (entry0378 i).check = true at h
  rcases fields0378 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0379 : OriginalRow227TriangleForward0379.entries.size = 32 := rfl

def entry0379 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0379.entries[i.val]'(by rw [size0379]; exact i.isLt)

theorem fields0379 (i : Fin 32) :
    (entry0379 i).IA = shift ∧ (entry0379 i).ID = S (280 + i.val + 1) ∧
      (entry0379 i).IC = S 25 ∧ (entry0379 i).Inext = T 24 (280 + i.val + 1) ∧
      (entry0379 i).Icur = T 24 (280 + i.val) ∧
      (entry0379 i).output = T 25 (280 + i.val) ∧
      (entry0379 i).charge = charge 24 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0379 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 25) (T 24 (280 + i.val + 1))
      (T 24 (280 + i.val)) (T 25 (280 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0379.entries OriginalRow227TriangleForward0379.checked
    ⟨i.val, by rw [size0379]; exact i.isLt⟩
  change (entry0379 i).check = true at h
  rcases fields0379 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0380 : OriginalRow227TriangleForward0380.entries.size = 32 := rfl

def entry0380 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0380.entries[i.val]'(by rw [size0380]; exact i.isLt)

theorem fields0380 (i : Fin 32) :
    (entry0380 i).IA = shift ∧ (entry0380 i).ID = S (312 + i.val + 1) ∧
      (entry0380 i).IC = S 25 ∧ (entry0380 i).Inext = T 24 (312 + i.val + 1) ∧
      (entry0380 i).Icur = T 24 (312 + i.val) ∧
      (entry0380 i).output = T 25 (312 + i.val) ∧
      (entry0380 i).charge = charge 24 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0380 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 25) (T 24 (312 + i.val + 1))
      (T 24 (312 + i.val)) (T 25 (312 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0380.entries OriginalRow227TriangleForward0380.checked
    ⟨i.val, by rw [size0380]; exact i.isLt⟩
  change (entry0380 i).check = true at h
  rcases fields0380 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0381 : OriginalRow227TriangleForward0381.entries.size = 32 := rfl

def entry0381 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0381.entries[i.val]'(by rw [size0381]; exact i.isLt)

theorem fields0381 (i : Fin 32) :
    (entry0381 i).IA = shift ∧ (entry0381 i).ID = S (344 + i.val + 1) ∧
      (entry0381 i).IC = S 25 ∧ (entry0381 i).Inext = T 24 (344 + i.val + 1) ∧
      (entry0381 i).Icur = T 24 (344 + i.val) ∧
      (entry0381 i).output = T 25 (344 + i.val) ∧
      (entry0381 i).charge = charge 24 (344 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0381 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (344 + i.val)) shift
      (S (344 + i.val + 1)) (S 25) (T 24 (344 + i.val + 1))
      (T 24 (344 + i.val)) (T 25 (344 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0381.entries OriginalRow227TriangleForward0381.checked
    ⟨i.val, by rw [size0381]; exact i.isLt⟩
  change (entry0381 i).check = true at h
  rcases fields0381 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0382 : OriginalRow227TriangleForward0382.entries.size = 32 := rfl

def entry0382 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0382.entries[i.val]'(by rw [size0382]; exact i.isLt)

theorem fields0382 (i : Fin 32) :
    (entry0382 i).IA = shift ∧ (entry0382 i).ID = S (376 + i.val + 1) ∧
      (entry0382 i).IC = S 25 ∧ (entry0382 i).Inext = T 24 (376 + i.val + 1) ∧
      (entry0382 i).Icur = T 24 (376 + i.val) ∧
      (entry0382 i).output = T 25 (376 + i.val) ∧
      (entry0382 i).charge = charge 24 (376 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0382 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (376 + i.val)) shift
      (S (376 + i.val + 1)) (S 25) (T 24 (376 + i.val + 1))
      (T 24 (376 + i.val)) (T 25 (376 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0382.entries OriginalRow227TriangleForward0382.checked
    ⟨i.val, by rw [size0382]; exact i.isLt⟩
  change (entry0382 i).check = true at h
  rcases fields0382 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0383 : OriginalRow227TriangleForward0383.entries.size = 32 := rfl

def entry0383 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0383.entries[i.val]'(by rw [size0383]; exact i.isLt)

theorem fields0383 (i : Fin 32) :
    (entry0383 i).IA = shift ∧ (entry0383 i).ID = S (408 + i.val + 1) ∧
      (entry0383 i).IC = S 25 ∧ (entry0383 i).Inext = T 24 (408 + i.val + 1) ∧
      (entry0383 i).Icur = T 24 (408 + i.val) ∧
      (entry0383 i).output = T 25 (408 + i.val) ∧
      (entry0383 i).charge = charge 24 (408 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0383 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (408 + i.val)) shift
      (S (408 + i.val + 1)) (S 25) (T 24 (408 + i.val + 1))
      (T 24 (408 + i.val)) (T 25 (408 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0383.entries OriginalRow227TriangleForward0383.checked
    ⟨i.val, by rw [size0383]; exact i.isLt⟩
  change (entry0383 i).check = true at h
  rcases fields0383 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0384 : OriginalRow227TriangleForward0384.entries.size = 32 := rfl

def entry0384 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0384.entries[i.val]'(by rw [size0384]; exact i.isLt)

theorem fields0384 (i : Fin 32) :
    (entry0384 i).IA = shift ∧ (entry0384 i).ID = S (440 + i.val + 1) ∧
      (entry0384 i).IC = S 25 ∧ (entry0384 i).Inext = T 24 (440 + i.val + 1) ∧
      (entry0384 i).Icur = T 24 (440 + i.val) ∧
      (entry0384 i).output = T 25 (440 + i.val) ∧
      (entry0384 i).charge = charge 24 (440 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0384 (i : Fin 32) :
    forwardStepOK (-768) (charge 24 (440 + i.val)) shift
      (S (440 + i.val + 1)) (S 25) (T 24 (440 + i.val + 1))
      (T 24 (440 + i.val)) (T 25 (440 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0384.entries OriginalRow227TriangleForward0384.checked
    ⟨i.val, by rw [size0384]; exact i.isLt⟩
  change (entry0384 i).check = true at h
  rcases fields0384 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0385 : OriginalRow227TriangleForward0385.entries.size = 5 := rfl

def entry0385 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0385.entries[i.val]'(by rw [size0385]; exact i.isLt)

theorem fields0385 (i : Fin 5) :
    (entry0385 i).IA = shift ∧ (entry0385 i).ID = S (472 + i.val + 1) ∧
      (entry0385 i).IC = S 25 ∧ (entry0385 i).Inext = T 24 (472 + i.val + 1) ∧
      (entry0385 i).Icur = T 24 (472 + i.val) ∧
      (entry0385 i).output = T 25 (472 + i.val) ∧
      (entry0385 i).charge = charge 24 (472 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨4, by decide⟩).symm, rfl⟩

theorem step0385 (i : Fin 5) :
    forwardStepOK (-768) (charge 24 (472 + i.val)) shift
      (S (472 + i.val + 1)) (S 25) (T 24 (472 + i.val + 1))
      (T 24 (472 + i.val)) (T 25 (472 + i.val))
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0385.entries OriginalRow227TriangleForward0385.checked
    ⟨i.val, by rw [size0385]; exact i.isLt⟩
  change (entry0385 i).check = true at h
  rcases fields0385 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 24 ≤ d) (hhi : d < 477) :
    forwardStepOK (-768) (charge 24 d) shift (S (d + 1)) (S 25)
      (T 24 (d + 1)) (T 24 d) (T 25 d)
      (OriginalRow227Roots.root_pos 25 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 24 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h120 : d < 120
    ·
      by_cases h56 : d < 56
      ·
        have hi : d - 24 < 32 := by omega
        have heq : 24 + (d - 24) = d := by omega
        simpa only [heq] using step0371 ⟨d - 24, hi⟩
      ·
        by_cases h88 : d < 88
        ·
          have hi : d - 56 < 32 := by omega
          have heq : 56 + (d - 56) = d := by omega
          simpa only [heq] using step0372 ⟨d - 56, hi⟩
        ·
          have hi : d - 88 < 32 := by omega
          have heq : 88 + (d - 88) = d := by omega
          simpa only [heq] using step0373 ⟨d - 88, hi⟩
    ·
      by_cases h184 : d < 184
      ·
        by_cases h152 : d < 152
        ·
          have hi : d - 120 < 32 := by omega
          have heq : 120 + (d - 120) = d := by omega
          simpa only [heq] using step0374 ⟨d - 120, hi⟩
        ·
          have hi : d - 152 < 32 := by omega
          have heq : 152 + (d - 152) = d := by omega
          simpa only [heq] using step0375 ⟨d - 152, hi⟩
      ·
        by_cases h216 : d < 216
        ·
          have hi : d - 184 < 32 := by omega
          have heq : 184 + (d - 184) = d := by omega
          simpa only [heq] using step0376 ⟨d - 184, hi⟩
        ·
          have hi : d - 216 < 32 := by omega
          have heq : 216 + (d - 216) = d := by omega
          simpa only [heq] using step0377 ⟨d - 216, hi⟩
  ·
    by_cases h376 : d < 376
    ·
      by_cases h312 : d < 312
      ·
        by_cases h280 : d < 280
        ·
          have hi : d - 248 < 32 := by omega
          have heq : 248 + (d - 248) = d := by omega
          simpa only [heq] using step0378 ⟨d - 248, hi⟩
        ·
          have hi : d - 280 < 32 := by omega
          have heq : 280 + (d - 280) = d := by omega
          simpa only [heq] using step0379 ⟨d - 280, hi⟩
      ·
        by_cases h344 : d < 344
        ·
          have hi : d - 312 < 32 := by omega
          have heq : 312 + (d - 312) = d := by omega
          simpa only [heq] using step0380 ⟨d - 312, hi⟩
        ·
          have hi : d - 344 < 32 := by omega
          have heq : 344 + (d - 344) = d := by omega
          simpa only [heq] using step0381 ⟨d - 344, hi⟩
    ·
      by_cases h440 : d < 440
      ·
        by_cases h408 : d < 408
        ·
          have hi : d - 376 < 32 := by omega
          have heq : 376 + (d - 376) = d := by omega
          simpa only [heq] using step0382 ⟨d - 376, hi⟩
        ·
          have hi : d - 408 < 32 := by omega
          have heq : 408 + (d - 408) = d := by omega
          simpa only [heq] using step0383 ⟨d - 408, hi⟩
      ·
        by_cases h472 : d < 472
        ·
          have hi : d - 440 < 32 := by omega
          have heq : 440 + (d - 440) = d := by omega
          simpa only [heq] using step0384 ⟨d - 440, hi⟩
        ·
          have hi : d - 472 < 5 := by omega
          have heq : 472 + (d - 472) = d := by omega
          simpa only [heq] using step0385 ⟨d - 472, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0371,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0371,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0372,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0372,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0373,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0373,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0374,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0374,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0375,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0375,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0376,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0376,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0377,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0377,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0378,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0378,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0379,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0379,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0380,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0380,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0381,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0381,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0382,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0382,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0383,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0383,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0384,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0384,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.fields0385,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.step0385,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow025
