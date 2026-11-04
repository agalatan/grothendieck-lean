import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026
import Grothe.UpperChaos.OriginalRow227TriangleForward0386
import Grothe.UpperChaos.OriginalRow227TriangleForward0387
import Grothe.UpperChaos.OriginalRow227TriangleForward0388
import Grothe.UpperChaos.OriginalRow227TriangleForward0389
import Grothe.UpperChaos.OriginalRow227TriangleForward0390
import Grothe.UpperChaos.OriginalRow227TriangleForward0391
import Grothe.UpperChaos.OriginalRow227TriangleForward0392
import Grothe.UpperChaos.OriginalRow227TriangleForward0393
import Grothe.UpperChaos.OriginalRow227TriangleForward0394
import Grothe.UpperChaos.OriginalRow227TriangleForward0395
import Grothe.UpperChaos.OriginalRow227TriangleForward0396
import Grothe.UpperChaos.OriginalRow227TriangleForward0397
import Grothe.UpperChaos.OriginalRow227TriangleForward0398
import Grothe.UpperChaos.OriginalRow227TriangleForward0399
import Grothe.UpperChaos.OriginalRow227TriangleForward0400

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0386 : OriginalRow227TriangleForward0386.entries.size = 32 := rfl

def entry0386 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0386.entries[i.val]'(by rw [size0386]; exact i.isLt)

theorem fields0386 (i : Fin 32) :
    (entry0386 i).IA = shift ∧ (entry0386 i).ID = S (25 + i.val + 1) ∧
      (entry0386 i).IC = S 26 ∧ (entry0386 i).Inext = T 25 (25 + i.val + 1) ∧
      (entry0386 i).Icur = T 25 (25 + i.val) ∧
      (entry0386 i).output = T 26 (25 + i.val) ∧
      (entry0386 i).charge = charge 25 (25 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0387_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0386 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (25 + i.val)) shift
      (S (25 + i.val + 1)) (S 26) (T 25 (25 + i.val + 1))
      (T 25 (25 + i.val)) (T 26 (25 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0386.entries OriginalRow227TriangleForward0386.checked
    ⟨i.val, by rw [size0386]; exact i.isLt⟩
  change (entry0386 i).check = true at h
  rcases fields0386 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0387 : OriginalRow227TriangleForward0387.entries.size = 32 := rfl

def entry0387 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0387.entries[i.val]'(by rw [size0387]; exact i.isLt)

theorem fields0387 (i : Fin 32) :
    (entry0387 i).IA = shift ∧ (entry0387 i).ID = S (57 + i.val + 1) ∧
      (entry0387 i).IC = S 26 ∧ (entry0387 i).Inext = T 25 (57 + i.val + 1) ∧
      (entry0387 i).Icur = T 25 (57 + i.val) ∧
      (entry0387 i).output = T 26 (57 + i.val) ∧
      (entry0387 i).charge = charge 25 (57 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0388_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0387 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (57 + i.val)) shift
      (S (57 + i.val + 1)) (S 26) (T 25 (57 + i.val + 1))
      (T 25 (57 + i.val)) (T 26 (57 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0387.entries OriginalRow227TriangleForward0387.checked
    ⟨i.val, by rw [size0387]; exact i.isLt⟩
  change (entry0387 i).check = true at h
  rcases fields0387 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0388 : OriginalRow227TriangleForward0388.entries.size = 32 := rfl

def entry0388 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0388.entries[i.val]'(by rw [size0388]; exact i.isLt)

theorem fields0388 (i : Fin 32) :
    (entry0388 i).IA = shift ∧ (entry0388 i).ID = S (89 + i.val + 1) ∧
      (entry0388 i).IC = S 26 ∧ (entry0388 i).Inext = T 25 (89 + i.val + 1) ∧
      (entry0388 i).Icur = T 25 (89 + i.val) ∧
      (entry0388 i).output = T 26 (89 + i.val) ∧
      (entry0388 i).charge = charge 25 (89 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0389_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0388 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (89 + i.val)) shift
      (S (89 + i.val + 1)) (S 26) (T 25 (89 + i.val + 1))
      (T 25 (89 + i.val)) (T 26 (89 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0388.entries OriginalRow227TriangleForward0388.checked
    ⟨i.val, by rw [size0388]; exact i.isLt⟩
  change (entry0388 i).check = true at h
  rcases fields0388 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0389 : OriginalRow227TriangleForward0389.entries.size = 32 := rfl

def entry0389 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0389.entries[i.val]'(by rw [size0389]; exact i.isLt)

theorem fields0389 (i : Fin 32) :
    (entry0389 i).IA = shift ∧ (entry0389 i).ID = S (121 + i.val + 1) ∧
      (entry0389 i).IC = S 26 ∧ (entry0389 i).Inext = T 25 (121 + i.val + 1) ∧
      (entry0389 i).Icur = T 25 (121 + i.val) ∧
      (entry0389 i).output = T 26 (121 + i.val) ∧
      (entry0389 i).charge = charge 25 (121 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0390_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0389 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (121 + i.val)) shift
      (S (121 + i.val + 1)) (S 26) (T 25 (121 + i.val + 1))
      (T 25 (121 + i.val)) (T 26 (121 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0389.entries OriginalRow227TriangleForward0389.checked
    ⟨i.val, by rw [size0389]; exact i.isLt⟩
  change (entry0389 i).check = true at h
  rcases fields0389 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0390 : OriginalRow227TriangleForward0390.entries.size = 32 := rfl

def entry0390 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0390.entries[i.val]'(by rw [size0390]; exact i.isLt)

theorem fields0390 (i : Fin 32) :
    (entry0390 i).IA = shift ∧ (entry0390 i).ID = S (153 + i.val + 1) ∧
      (entry0390 i).IC = S 26 ∧ (entry0390 i).Inext = T 25 (153 + i.val + 1) ∧
      (entry0390 i).Icur = T 25 (153 + i.val) ∧
      (entry0390 i).output = T 26 (153 + i.val) ∧
      (entry0390 i).charge = charge 25 (153 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0391_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0390 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (153 + i.val)) shift
      (S (153 + i.val + 1)) (S 26) (T 25 (153 + i.val + 1))
      (T 25 (153 + i.val)) (T 26 (153 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0390.entries OriginalRow227TriangleForward0390.checked
    ⟨i.val, by rw [size0390]; exact i.isLt⟩
  change (entry0390 i).check = true at h
  rcases fields0390 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0391 : OriginalRow227TriangleForward0391.entries.size = 32 := rfl

def entry0391 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0391.entries[i.val]'(by rw [size0391]; exact i.isLt)

theorem fields0391 (i : Fin 32) :
    (entry0391 i).IA = shift ∧ (entry0391 i).ID = S (185 + i.val + 1) ∧
      (entry0391 i).IC = S 26 ∧ (entry0391 i).Inext = T 25 (185 + i.val + 1) ∧
      (entry0391 i).Icur = T 25 (185 + i.val) ∧
      (entry0391 i).output = T 26 (185 + i.val) ∧
      (entry0391 i).charge = charge 25 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0392_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0391 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 26) (T 25 (185 + i.val + 1))
      (T 25 (185 + i.val)) (T 26 (185 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0391.entries OriginalRow227TriangleForward0391.checked
    ⟨i.val, by rw [size0391]; exact i.isLt⟩
  change (entry0391 i).check = true at h
  rcases fields0391 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0392 : OriginalRow227TriangleForward0392.entries.size = 32 := rfl

def entry0392 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0392.entries[i.val]'(by rw [size0392]; exact i.isLt)

theorem fields0392 (i : Fin 32) :
    (entry0392 i).IA = shift ∧ (entry0392 i).ID = S (217 + i.val + 1) ∧
      (entry0392 i).IC = S 26 ∧ (entry0392 i).Inext = T 25 (217 + i.val + 1) ∧
      (entry0392 i).Icur = T 25 (217 + i.val) ∧
      (entry0392 i).output = T 26 (217 + i.val) ∧
      (entry0392 i).charge = charge 25 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0393_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0392 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 26) (T 25 (217 + i.val + 1))
      (T 25 (217 + i.val)) (T 26 (217 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0392.entries OriginalRow227TriangleForward0392.checked
    ⟨i.val, by rw [size0392]; exact i.isLt⟩
  change (entry0392 i).check = true at h
  rcases fields0392 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0393 : OriginalRow227TriangleForward0393.entries.size = 32 := rfl

def entry0393 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0393.entries[i.val]'(by rw [size0393]; exact i.isLt)

theorem fields0393 (i : Fin 32) :
    (entry0393 i).IA = shift ∧ (entry0393 i).ID = S (249 + i.val + 1) ∧
      (entry0393 i).IC = S 26 ∧ (entry0393 i).Inext = T 25 (249 + i.val + 1) ∧
      (entry0393 i).Icur = T 25 (249 + i.val) ∧
      (entry0393 i).output = T 26 (249 + i.val) ∧
      (entry0393 i).charge = charge 25 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0394_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0393 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 26) (T 25 (249 + i.val + 1))
      (T 25 (249 + i.val)) (T 26 (249 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0393.entries OriginalRow227TriangleForward0393.checked
    ⟨i.val, by rw [size0393]; exact i.isLt⟩
  change (entry0393 i).check = true at h
  rcases fields0393 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0394 : OriginalRow227TriangleForward0394.entries.size = 32 := rfl

def entry0394 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0394.entries[i.val]'(by rw [size0394]; exact i.isLt)

theorem fields0394 (i : Fin 32) :
    (entry0394 i).IA = shift ∧ (entry0394 i).ID = S (281 + i.val + 1) ∧
      (entry0394 i).IC = S 26 ∧ (entry0394 i).Inext = T 25 (281 + i.val + 1) ∧
      (entry0394 i).Icur = T 25 (281 + i.val) ∧
      (entry0394 i).output = T 26 (281 + i.val) ∧
      (entry0394 i).charge = charge 25 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0395_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0394 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 26) (T 25 (281 + i.val + 1))
      (T 25 (281 + i.val)) (T 26 (281 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0394.entries OriginalRow227TriangleForward0394.checked
    ⟨i.val, by rw [size0394]; exact i.isLt⟩
  change (entry0394 i).check = true at h
  rcases fields0394 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0395 : OriginalRow227TriangleForward0395.entries.size = 32 := rfl

def entry0395 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0395.entries[i.val]'(by rw [size0395]; exact i.isLt)

theorem fields0395 (i : Fin 32) :
    (entry0395 i).IA = shift ∧ (entry0395 i).ID = S (313 + i.val + 1) ∧
      (entry0395 i).IC = S 26 ∧ (entry0395 i).Inext = T 25 (313 + i.val + 1) ∧
      (entry0395 i).Icur = T 25 (313 + i.val) ∧
      (entry0395 i).output = T 26 (313 + i.val) ∧
      (entry0395 i).charge = charge 25 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0396_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0395 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 26) (T 25 (313 + i.val + 1))
      (T 25 (313 + i.val)) (T 26 (313 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0395.entries OriginalRow227TriangleForward0395.checked
    ⟨i.val, by rw [size0395]; exact i.isLt⟩
  change (entry0395 i).check = true at h
  rcases fields0395 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0396 : OriginalRow227TriangleForward0396.entries.size = 32 := rfl

def entry0396 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0396.entries[i.val]'(by rw [size0396]; exact i.isLt)

theorem fields0396 (i : Fin 32) :
    (entry0396 i).IA = shift ∧ (entry0396 i).ID = S (345 + i.val + 1) ∧
      (entry0396 i).IC = S 26 ∧ (entry0396 i).Inext = T 25 (345 + i.val + 1) ∧
      (entry0396 i).Icur = T 25 (345 + i.val) ∧
      (entry0396 i).output = T 26 (345 + i.val) ∧
      (entry0396 i).charge = charge 25 (345 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0397_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0396 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (345 + i.val)) shift
      (S (345 + i.val + 1)) (S 26) (T 25 (345 + i.val + 1))
      (T 25 (345 + i.val)) (T 26 (345 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0396.entries OriginalRow227TriangleForward0396.checked
    ⟨i.val, by rw [size0396]; exact i.isLt⟩
  change (entry0396 i).check = true at h
  rcases fields0396 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0397 : OriginalRow227TriangleForward0397.entries.size = 32 := rfl

def entry0397 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0397.entries[i.val]'(by rw [size0397]; exact i.isLt)

theorem fields0397 (i : Fin 32) :
    (entry0397 i).IA = shift ∧ (entry0397 i).ID = S (377 + i.val + 1) ∧
      (entry0397 i).IC = S 26 ∧ (entry0397 i).Inext = T 25 (377 + i.val + 1) ∧
      (entry0397 i).Icur = T 25 (377 + i.val) ∧
      (entry0397 i).output = T 26 (377 + i.val) ∧
      (entry0397 i).charge = charge 25 (377 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0398_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0397 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (377 + i.val)) shift
      (S (377 + i.val + 1)) (S 26) (T 25 (377 + i.val + 1))
      (T 25 (377 + i.val)) (T 26 (377 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0397.entries OriginalRow227TriangleForward0397.checked
    ⟨i.val, by rw [size0397]; exact i.isLt⟩
  change (entry0397 i).check = true at h
  rcases fields0397 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0398 : OriginalRow227TriangleForward0398.entries.size = 32 := rfl

def entry0398 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0398.entries[i.val]'(by rw [size0398]; exact i.isLt)

theorem fields0398 (i : Fin 32) :
    (entry0398 i).IA = shift ∧ (entry0398 i).ID = S (409 + i.val + 1) ∧
      (entry0398 i).IC = S 26 ∧ (entry0398 i).Inext = T 25 (409 + i.val + 1) ∧
      (entry0398 i).Icur = T 25 (409 + i.val) ∧
      (entry0398 i).output = T 26 (409 + i.val) ∧
      (entry0398 i).charge = charge 25 (409 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0399_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0398 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (409 + i.val)) shift
      (S (409 + i.val + 1)) (S 26) (T 25 (409 + i.val + 1))
      (T 25 (409 + i.val)) (T 26 (409 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0398.entries OriginalRow227TriangleForward0398.checked
    ⟨i.val, by rw [size0398]; exact i.isLt⟩
  change (entry0398 i).check = true at h
  rcases fields0398 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0399 : OriginalRow227TriangleForward0399.entries.size = 32 := rfl

def entry0399 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0399.entries[i.val]'(by rw [size0399]; exact i.isLt)

theorem fields0399 (i : Fin 32) :
    (entry0399 i).IA = shift ∧ (entry0399 i).ID = S (441 + i.val + 1) ∧
      (entry0399 i).IC = S 26 ∧ (entry0399 i).Inext = T 25 (441 + i.val + 1) ∧
      (entry0399 i).Icur = T 25 (441 + i.val) ∧
      (entry0399 i).output = T 26 (441 + i.val) ∧
      (entry0399 i).charge = charge 25 (441 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0400_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0399 (i : Fin 32) :
    forwardStepOK (-768) (charge 25 (441 + i.val)) shift
      (S (441 + i.val + 1)) (S 26) (T 25 (441 + i.val + 1))
      (T 25 (441 + i.val)) (T 26 (441 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0399.entries OriginalRow227TriangleForward0399.checked
    ⟨i.val, by rw [size0399]; exact i.isLt⟩
  change (entry0399 i).check = true at h
  rcases fields0399 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0400 : OriginalRow227TriangleForward0400.entries.size = 3 := rfl

def entry0400 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0400.entries[i.val]'(by rw [size0400]; exact i.isLt)

theorem fields0400 (i : Fin 3) :
    (entry0400 i).IA = shift ∧ (entry0400 i).ID = S (473 + i.val + 1) ∧
      (entry0400 i).IC = S 26 ∧ (entry0400 i).Inext = T 25 (473 + i.val + 1) ∧
      (entry0400 i).Icur = T 25 (473 + i.val) ∧
      (entry0400 i).output = T 26 (473 + i.val) ∧
      (entry0400 i).charge = charge 25 (473 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow025.block0401_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨2, by decide⟩).symm, rfl⟩

theorem step0400 (i : Fin 3) :
    forwardStepOK (-768) (charge 25 (473 + i.val)) shift
      (S (473 + i.val + 1)) (S 26) (T 25 (473 + i.val + 1))
      (T 25 (473 + i.val)) (T 26 (473 + i.val))
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0400.entries OriginalRow227TriangleForward0400.checked
    ⟨i.val, by rw [size0400]; exact i.isLt⟩
  change (entry0400 i).check = true at h
  rcases fields0400 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 25 ≤ d) (hhi : d < 476) :
    forwardStepOK (-768) (charge 25 d) shift (S (d + 1)) (S 26)
      (T 25 (d + 1)) (T 25 d) (T 26 d)
      (OriginalRow227Roots.root_pos 26 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 25 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h121 : d < 121
    ·
      by_cases h57 : d < 57
      ·
        have hi : d - 25 < 32 := by omega
        have heq : 25 + (d - 25) = d := by omega
        simpa only [heq] using step0386 ⟨d - 25, hi⟩
      ·
        by_cases h89 : d < 89
        ·
          have hi : d - 57 < 32 := by omega
          have heq : 57 + (d - 57) = d := by omega
          simpa only [heq] using step0387 ⟨d - 57, hi⟩
        ·
          have hi : d - 89 < 32 := by omega
          have heq : 89 + (d - 89) = d := by omega
          simpa only [heq] using step0388 ⟨d - 89, hi⟩
    ·
      by_cases h185 : d < 185
      ·
        by_cases h153 : d < 153
        ·
          have hi : d - 121 < 32 := by omega
          have heq : 121 + (d - 121) = d := by omega
          simpa only [heq] using step0389 ⟨d - 121, hi⟩
        ·
          have hi : d - 153 < 32 := by omega
          have heq : 153 + (d - 153) = d := by omega
          simpa only [heq] using step0390 ⟨d - 153, hi⟩
      ·
        by_cases h217 : d < 217
        ·
          have hi : d - 185 < 32 := by omega
          have heq : 185 + (d - 185) = d := by omega
          simpa only [heq] using step0391 ⟨d - 185, hi⟩
        ·
          have hi : d - 217 < 32 := by omega
          have heq : 217 + (d - 217) = d := by omega
          simpa only [heq] using step0392 ⟨d - 217, hi⟩
  ·
    by_cases h377 : d < 377
    ·
      by_cases h313 : d < 313
      ·
        by_cases h281 : d < 281
        ·
          have hi : d - 249 < 32 := by omega
          have heq : 249 + (d - 249) = d := by omega
          simpa only [heq] using step0393 ⟨d - 249, hi⟩
        ·
          have hi : d - 281 < 32 := by omega
          have heq : 281 + (d - 281) = d := by omega
          simpa only [heq] using step0394 ⟨d - 281, hi⟩
      ·
        by_cases h345 : d < 345
        ·
          have hi : d - 313 < 32 := by omega
          have heq : 313 + (d - 313) = d := by omega
          simpa only [heq] using step0395 ⟨d - 313, hi⟩
        ·
          have hi : d - 345 < 32 := by omega
          have heq : 345 + (d - 345) = d := by omega
          simpa only [heq] using step0396 ⟨d - 345, hi⟩
    ·
      by_cases h441 : d < 441
      ·
        by_cases h409 : d < 409
        ·
          have hi : d - 377 < 32 := by omega
          have heq : 377 + (d - 377) = d := by omega
          simpa only [heq] using step0397 ⟨d - 377, hi⟩
        ·
          have hi : d - 409 < 32 := by omega
          have heq : 409 + (d - 409) = d := by omega
          simpa only [heq] using step0398 ⟨d - 409, hi⟩
      ·
        by_cases h473 : d < 473
        ·
          have hi : d - 441 < 32 := by omega
          have heq : 441 + (d - 441) = d := by omega
          simpa only [heq] using step0399 ⟨d - 441, hi⟩
        ·
          have hi : d - 473 < 3 := by omega
          have heq : 473 + (d - 473) = d := by omega
          simpa only [heq] using step0400 ⟨d - 473, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0386,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0386,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0387,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0387,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0388,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0388,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0389,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0389,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0390,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0390,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0391,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0391,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0392,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0392,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0393,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0393,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0394,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0394,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0395,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0395,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0396,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0396,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0397,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0397,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0398,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0398,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0399,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0399,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.fields0400,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.step0400,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow026
