import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018
import Grothe.UpperChaos.OriginalRow227TriangleForward0266
import Grothe.UpperChaos.OriginalRow227TriangleForward0267
import Grothe.UpperChaos.OriginalRow227TriangleForward0268
import Grothe.UpperChaos.OriginalRow227TriangleForward0269
import Grothe.UpperChaos.OriginalRow227TriangleForward0270
import Grothe.UpperChaos.OriginalRow227TriangleForward0271
import Grothe.UpperChaos.OriginalRow227TriangleForward0272
import Grothe.UpperChaos.OriginalRow227TriangleForward0273
import Grothe.UpperChaos.OriginalRow227TriangleForward0274
import Grothe.UpperChaos.OriginalRow227TriangleForward0275
import Grothe.UpperChaos.OriginalRow227TriangleForward0276
import Grothe.UpperChaos.OriginalRow227TriangleForward0277
import Grothe.UpperChaos.OriginalRow227TriangleForward0278
import Grothe.UpperChaos.OriginalRow227TriangleForward0279
import Grothe.UpperChaos.OriginalRow227TriangleForward0280

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0266 : OriginalRow227TriangleForward0266.entries.size = 32 := rfl

def entry0266 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0266.entries[i.val]'(by rw [size0266]; exact i.isLt)

theorem fields0266 (i : Fin 32) :
    (entry0266 i).IA = shift ∧ (entry0266 i).ID = S (17 + i.val + 1) ∧
      (entry0266 i).IC = S 18 ∧ (entry0266 i).Inext = T 17 (17 + i.val + 1) ∧
      (entry0266 i).Icur = T 17 (17 + i.val) ∧
      (entry0266 i).output = T 18 (17 + i.val) ∧
      (entry0266 i).charge = charge 17 (17 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0266 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (17 + i.val)) shift
      (S (17 + i.val + 1)) (S 18) (T 17 (17 + i.val + 1))
      (T 17 (17 + i.val)) (T 18 (17 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0266.entries OriginalRow227TriangleForward0266.checked
    ⟨i.val, by rw [size0266]; exact i.isLt⟩
  change (entry0266 i).check = true at h
  rcases fields0266 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0267 : OriginalRow227TriangleForward0267.entries.size = 32 := rfl

def entry0267 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0267.entries[i.val]'(by rw [size0267]; exact i.isLt)

theorem fields0267 (i : Fin 32) :
    (entry0267 i).IA = shift ∧ (entry0267 i).ID = S (49 + i.val + 1) ∧
      (entry0267 i).IC = S 18 ∧ (entry0267 i).Inext = T 17 (49 + i.val + 1) ∧
      (entry0267 i).Icur = T 17 (49 + i.val) ∧
      (entry0267 i).output = T 18 (49 + i.val) ∧
      (entry0267 i).charge = charge 17 (49 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0267 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (49 + i.val)) shift
      (S (49 + i.val + 1)) (S 18) (T 17 (49 + i.val + 1))
      (T 17 (49 + i.val)) (T 18 (49 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0267.entries OriginalRow227TriangleForward0267.checked
    ⟨i.val, by rw [size0267]; exact i.isLt⟩
  change (entry0267 i).check = true at h
  rcases fields0267 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0268 : OriginalRow227TriangleForward0268.entries.size = 32 := rfl

def entry0268 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0268.entries[i.val]'(by rw [size0268]; exact i.isLt)

theorem fields0268 (i : Fin 32) :
    (entry0268 i).IA = shift ∧ (entry0268 i).ID = S (81 + i.val + 1) ∧
      (entry0268 i).IC = S 18 ∧ (entry0268 i).Inext = T 17 (81 + i.val + 1) ∧
      (entry0268 i).Icur = T 17 (81 + i.val) ∧
      (entry0268 i).output = T 18 (81 + i.val) ∧
      (entry0268 i).charge = charge 17 (81 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0268 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (81 + i.val)) shift
      (S (81 + i.val + 1)) (S 18) (T 17 (81 + i.val + 1))
      (T 17 (81 + i.val)) (T 18 (81 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0268.entries OriginalRow227TriangleForward0268.checked
    ⟨i.val, by rw [size0268]; exact i.isLt⟩
  change (entry0268 i).check = true at h
  rcases fields0268 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0269 : OriginalRow227TriangleForward0269.entries.size = 32 := rfl

def entry0269 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0269.entries[i.val]'(by rw [size0269]; exact i.isLt)

theorem fields0269 (i : Fin 32) :
    (entry0269 i).IA = shift ∧ (entry0269 i).ID = S (113 + i.val + 1) ∧
      (entry0269 i).IC = S 18 ∧ (entry0269 i).Inext = T 17 (113 + i.val + 1) ∧
      (entry0269 i).Icur = T 17 (113 + i.val) ∧
      (entry0269 i).output = T 18 (113 + i.val) ∧
      (entry0269 i).charge = charge 17 (113 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0269 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (113 + i.val)) shift
      (S (113 + i.val + 1)) (S 18) (T 17 (113 + i.val + 1))
      (T 17 (113 + i.val)) (T 18 (113 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0269.entries OriginalRow227TriangleForward0269.checked
    ⟨i.val, by rw [size0269]; exact i.isLt⟩
  change (entry0269 i).check = true at h
  rcases fields0269 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0270 : OriginalRow227TriangleForward0270.entries.size = 32 := rfl

def entry0270 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0270.entries[i.val]'(by rw [size0270]; exact i.isLt)

theorem fields0270 (i : Fin 32) :
    (entry0270 i).IA = shift ∧ (entry0270 i).ID = S (145 + i.val + 1) ∧
      (entry0270 i).IC = S 18 ∧ (entry0270 i).Inext = T 17 (145 + i.val + 1) ∧
      (entry0270 i).Icur = T 17 (145 + i.val) ∧
      (entry0270 i).output = T 18 (145 + i.val) ∧
      (entry0270 i).charge = charge 17 (145 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0270 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (145 + i.val)) shift
      (S (145 + i.val + 1)) (S 18) (T 17 (145 + i.val + 1))
      (T 17 (145 + i.val)) (T 18 (145 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0270.entries OriginalRow227TriangleForward0270.checked
    ⟨i.val, by rw [size0270]; exact i.isLt⟩
  change (entry0270 i).check = true at h
  rcases fields0270 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0271 : OriginalRow227TriangleForward0271.entries.size = 32 := rfl

def entry0271 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0271.entries[i.val]'(by rw [size0271]; exact i.isLt)

theorem fields0271 (i : Fin 32) :
    (entry0271 i).IA = shift ∧ (entry0271 i).ID = S (177 + i.val + 1) ∧
      (entry0271 i).IC = S 18 ∧ (entry0271 i).Inext = T 17 (177 + i.val + 1) ∧
      (entry0271 i).Icur = T 17 (177 + i.val) ∧
      (entry0271 i).output = T 18 (177 + i.val) ∧
      (entry0271 i).charge = charge 17 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0271 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 18) (T 17 (177 + i.val + 1))
      (T 17 (177 + i.val)) (T 18 (177 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0271.entries OriginalRow227TriangleForward0271.checked
    ⟨i.val, by rw [size0271]; exact i.isLt⟩
  change (entry0271 i).check = true at h
  rcases fields0271 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0272 : OriginalRow227TriangleForward0272.entries.size = 32 := rfl

def entry0272 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0272.entries[i.val]'(by rw [size0272]; exact i.isLt)

theorem fields0272 (i : Fin 32) :
    (entry0272 i).IA = shift ∧ (entry0272 i).ID = S (209 + i.val + 1) ∧
      (entry0272 i).IC = S 18 ∧ (entry0272 i).Inext = T 17 (209 + i.val + 1) ∧
      (entry0272 i).Icur = T 17 (209 + i.val) ∧
      (entry0272 i).output = T 18 (209 + i.val) ∧
      (entry0272 i).charge = charge 17 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0272 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 18) (T 17 (209 + i.val + 1))
      (T 17 (209 + i.val)) (T 18 (209 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0272.entries OriginalRow227TriangleForward0272.checked
    ⟨i.val, by rw [size0272]; exact i.isLt⟩
  change (entry0272 i).check = true at h
  rcases fields0272 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0273 : OriginalRow227TriangleForward0273.entries.size = 32 := rfl

def entry0273 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0273.entries[i.val]'(by rw [size0273]; exact i.isLt)

theorem fields0273 (i : Fin 32) :
    (entry0273 i).IA = shift ∧ (entry0273 i).ID = S (241 + i.val + 1) ∧
      (entry0273 i).IC = S 18 ∧ (entry0273 i).Inext = T 17 (241 + i.val + 1) ∧
      (entry0273 i).Icur = T 17 (241 + i.val) ∧
      (entry0273 i).output = T 18 (241 + i.val) ∧
      (entry0273 i).charge = charge 17 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0273 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 18) (T 17 (241 + i.val + 1))
      (T 17 (241 + i.val)) (T 18 (241 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0273.entries OriginalRow227TriangleForward0273.checked
    ⟨i.val, by rw [size0273]; exact i.isLt⟩
  change (entry0273 i).check = true at h
  rcases fields0273 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0274 : OriginalRow227TriangleForward0274.entries.size = 32 := rfl

def entry0274 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0274.entries[i.val]'(by rw [size0274]; exact i.isLt)

theorem fields0274 (i : Fin 32) :
    (entry0274 i).IA = shift ∧ (entry0274 i).ID = S (273 + i.val + 1) ∧
      (entry0274 i).IC = S 18 ∧ (entry0274 i).Inext = T 17 (273 + i.val + 1) ∧
      (entry0274 i).Icur = T 17 (273 + i.val) ∧
      (entry0274 i).output = T 18 (273 + i.val) ∧
      (entry0274 i).charge = charge 17 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0274 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 18) (T 17 (273 + i.val + 1))
      (T 17 (273 + i.val)) (T 18 (273 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0274.entries OriginalRow227TriangleForward0274.checked
    ⟨i.val, by rw [size0274]; exact i.isLt⟩
  change (entry0274 i).check = true at h
  rcases fields0274 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0275 : OriginalRow227TriangleForward0275.entries.size = 32 := rfl

def entry0275 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0275.entries[i.val]'(by rw [size0275]; exact i.isLt)

theorem fields0275 (i : Fin 32) :
    (entry0275 i).IA = shift ∧ (entry0275 i).ID = S (305 + i.val + 1) ∧
      (entry0275 i).IC = S 18 ∧ (entry0275 i).Inext = T 17 (305 + i.val + 1) ∧
      (entry0275 i).Icur = T 17 (305 + i.val) ∧
      (entry0275 i).output = T 18 (305 + i.val) ∧
      (entry0275 i).charge = charge 17 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0275 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 18) (T 17 (305 + i.val + 1))
      (T 17 (305 + i.val)) (T 18 (305 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0275.entries OriginalRow227TriangleForward0275.checked
    ⟨i.val, by rw [size0275]; exact i.isLt⟩
  change (entry0275 i).check = true at h
  rcases fields0275 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0276 : OriginalRow227TriangleForward0276.entries.size = 32 := rfl

def entry0276 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0276.entries[i.val]'(by rw [size0276]; exact i.isLt)

theorem fields0276 (i : Fin 32) :
    (entry0276 i).IA = shift ∧ (entry0276 i).ID = S (337 + i.val + 1) ∧
      (entry0276 i).IC = S 18 ∧ (entry0276 i).Inext = T 17 (337 + i.val + 1) ∧
      (entry0276 i).Icur = T 17 (337 + i.val) ∧
      (entry0276 i).output = T 18 (337 + i.val) ∧
      (entry0276 i).charge = charge 17 (337 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0276 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (337 + i.val)) shift
      (S (337 + i.val + 1)) (S 18) (T 17 (337 + i.val + 1))
      (T 17 (337 + i.val)) (T 18 (337 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0276.entries OriginalRow227TriangleForward0276.checked
    ⟨i.val, by rw [size0276]; exact i.isLt⟩
  change (entry0276 i).check = true at h
  rcases fields0276 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0277 : OriginalRow227TriangleForward0277.entries.size = 32 := rfl

def entry0277 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0277.entries[i.val]'(by rw [size0277]; exact i.isLt)

theorem fields0277 (i : Fin 32) :
    (entry0277 i).IA = shift ∧ (entry0277 i).ID = S (369 + i.val + 1) ∧
      (entry0277 i).IC = S 18 ∧ (entry0277 i).Inext = T 17 (369 + i.val + 1) ∧
      (entry0277 i).Icur = T 17 (369 + i.val) ∧
      (entry0277 i).output = T 18 (369 + i.val) ∧
      (entry0277 i).charge = charge 17 (369 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0277 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (369 + i.val)) shift
      (S (369 + i.val + 1)) (S 18) (T 17 (369 + i.val + 1))
      (T 17 (369 + i.val)) (T 18 (369 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0277.entries OriginalRow227TriangleForward0277.checked
    ⟨i.val, by rw [size0277]; exact i.isLt⟩
  change (entry0277 i).check = true at h
  rcases fields0277 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0278 : OriginalRow227TriangleForward0278.entries.size = 32 := rfl

def entry0278 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0278.entries[i.val]'(by rw [size0278]; exact i.isLt)

theorem fields0278 (i : Fin 32) :
    (entry0278 i).IA = shift ∧ (entry0278 i).ID = S (401 + i.val + 1) ∧
      (entry0278 i).IC = S 18 ∧ (entry0278 i).Inext = T 17 (401 + i.val + 1) ∧
      (entry0278 i).Icur = T 17 (401 + i.val) ∧
      (entry0278 i).output = T 18 (401 + i.val) ∧
      (entry0278 i).charge = charge 17 (401 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0278 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (401 + i.val)) shift
      (S (401 + i.val + 1)) (S 18) (T 17 (401 + i.val + 1))
      (T 17 (401 + i.val)) (T 18 (401 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0278.entries OriginalRow227TriangleForward0278.checked
    ⟨i.val, by rw [size0278]; exact i.isLt⟩
  change (entry0278 i).check = true at h
  rcases fields0278 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0279 : OriginalRow227TriangleForward0279.entries.size = 32 := rfl

def entry0279 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0279.entries[i.val]'(by rw [size0279]; exact i.isLt)

theorem fields0279 (i : Fin 32) :
    (entry0279 i).IA = shift ∧ (entry0279 i).ID = S (433 + i.val + 1) ∧
      (entry0279 i).IC = S 18 ∧ (entry0279 i).Inext = T 17 (433 + i.val + 1) ∧
      (entry0279 i).Icur = T 17 (433 + i.val) ∧
      (entry0279 i).output = T 18 (433 + i.val) ∧
      (entry0279 i).charge = charge 17 (433 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0279 (i : Fin 32) :
    forwardStepOK (-768) (charge 17 (433 + i.val)) shift
      (S (433 + i.val + 1)) (S 18) (T 17 (433 + i.val + 1))
      (T 17 (433 + i.val)) (T 18 (433 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0279.entries OriginalRow227TriangleForward0279.checked
    ⟨i.val, by rw [size0279]; exact i.isLt⟩
  change (entry0279 i).check = true at h
  rcases fields0279 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0280 : OriginalRow227TriangleForward0280.entries.size = 19 := rfl

def entry0280 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0280.entries[i.val]'(by rw [size0280]; exact i.isLt)

theorem fields0280 (i : Fin 19) :
    (entry0280 i).IA = shift ∧ (entry0280 i).ID = S (465 + i.val + 1) ∧
      (entry0280 i).IC = S 18 ∧ (entry0280 i).Inext = T 17 (465 + i.val + 1) ∧
      (entry0280 i).Icur = T 17 (465 + i.val) ∧
      (entry0280 i).output = T 18 (465 + i.val) ∧
      (entry0280 i).charge = charge 17 (465 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨18, by decide⟩).symm, rfl⟩

theorem step0280 (i : Fin 19) :
    forwardStepOK (-768) (charge 17 (465 + i.val)) shift
      (S (465 + i.val + 1)) (S 18) (T 17 (465 + i.val + 1))
      (T 17 (465 + i.val)) (T 18 (465 + i.val))
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0280.entries OriginalRow227TriangleForward0280.checked
    ⟨i.val, by rw [size0280]; exact i.isLt⟩
  change (entry0280 i).check = true at h
  rcases fields0280 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 17 ≤ d) (hhi : d < 484) :
    forwardStepOK (-768) (charge 17 d) shift (S (d + 1)) (S 18)
      (T 17 (d + 1)) (T 17 d) (T 18 d)
      (OriginalRow227Roots.root_pos 18 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 17 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h113 : d < 113
    ·
      by_cases h49 : d < 49
      ·
        have hi : d - 17 < 32 := by omega
        have heq : 17 + (d - 17) = d := by omega
        simpa only [heq] using step0266 ⟨d - 17, hi⟩
      ·
        by_cases h81 : d < 81
        ·
          have hi : d - 49 < 32 := by omega
          have heq : 49 + (d - 49) = d := by omega
          simpa only [heq] using step0267 ⟨d - 49, hi⟩
        ·
          have hi : d - 81 < 32 := by omega
          have heq : 81 + (d - 81) = d := by omega
          simpa only [heq] using step0268 ⟨d - 81, hi⟩
    ·
      by_cases h177 : d < 177
      ·
        by_cases h145 : d < 145
        ·
          have hi : d - 113 < 32 := by omega
          have heq : 113 + (d - 113) = d := by omega
          simpa only [heq] using step0269 ⟨d - 113, hi⟩
        ·
          have hi : d - 145 < 32 := by omega
          have heq : 145 + (d - 145) = d := by omega
          simpa only [heq] using step0270 ⟨d - 145, hi⟩
      ·
        by_cases h209 : d < 209
        ·
          have hi : d - 177 < 32 := by omega
          have heq : 177 + (d - 177) = d := by omega
          simpa only [heq] using step0271 ⟨d - 177, hi⟩
        ·
          have hi : d - 209 < 32 := by omega
          have heq : 209 + (d - 209) = d := by omega
          simpa only [heq] using step0272 ⟨d - 209, hi⟩
  ·
    by_cases h369 : d < 369
    ·
      by_cases h305 : d < 305
      ·
        by_cases h273 : d < 273
        ·
          have hi : d - 241 < 32 := by omega
          have heq : 241 + (d - 241) = d := by omega
          simpa only [heq] using step0273 ⟨d - 241, hi⟩
        ·
          have hi : d - 273 < 32 := by omega
          have heq : 273 + (d - 273) = d := by omega
          simpa only [heq] using step0274 ⟨d - 273, hi⟩
      ·
        by_cases h337 : d < 337
        ·
          have hi : d - 305 < 32 := by omega
          have heq : 305 + (d - 305) = d := by omega
          simpa only [heq] using step0275 ⟨d - 305, hi⟩
        ·
          have hi : d - 337 < 32 := by omega
          have heq : 337 + (d - 337) = d := by omega
          simpa only [heq] using step0276 ⟨d - 337, hi⟩
    ·
      by_cases h433 : d < 433
      ·
        by_cases h401 : d < 401
        ·
          have hi : d - 369 < 32 := by omega
          have heq : 369 + (d - 369) = d := by omega
          simpa only [heq] using step0277 ⟨d - 369, hi⟩
        ·
          have hi : d - 401 < 32 := by omega
          have heq : 401 + (d - 401) = d := by omega
          simpa only [heq] using step0278 ⟨d - 401, hi⟩
      ·
        by_cases h465 : d < 465
        ·
          have hi : d - 433 < 32 := by omega
          have heq : 433 + (d - 433) = d := by omega
          simpa only [heq] using step0279 ⟨d - 433, hi⟩
        ·
          have hi : d - 465 < 19 := by omega
          have heq : 465 + (d - 465) = d := by omega
          simpa only [heq] using step0280 ⟨d - 465, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0266,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0266,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0267,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0267,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0268,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0268,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0269,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0269,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0270,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0270,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0271,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0271,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0272,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0272,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0273,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0273,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0274,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0274,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0275,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0275,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0276,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0276,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0277,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0277,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0278,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0278,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0279,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0279,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.fields0280,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.step0280,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow018
