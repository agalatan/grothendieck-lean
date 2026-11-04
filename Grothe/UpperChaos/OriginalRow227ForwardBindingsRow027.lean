import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027
import Grothe.UpperChaos.OriginalRow227TriangleForward0401
import Grothe.UpperChaos.OriginalRow227TriangleForward0402
import Grothe.UpperChaos.OriginalRow227TriangleForward0403
import Grothe.UpperChaos.OriginalRow227TriangleForward0404
import Grothe.UpperChaos.OriginalRow227TriangleForward0405
import Grothe.UpperChaos.OriginalRow227TriangleForward0406
import Grothe.UpperChaos.OriginalRow227TriangleForward0407
import Grothe.UpperChaos.OriginalRow227TriangleForward0408
import Grothe.UpperChaos.OriginalRow227TriangleForward0409
import Grothe.UpperChaos.OriginalRow227TriangleForward0410
import Grothe.UpperChaos.OriginalRow227TriangleForward0411
import Grothe.UpperChaos.OriginalRow227TriangleForward0412
import Grothe.UpperChaos.OriginalRow227TriangleForward0413
import Grothe.UpperChaos.OriginalRow227TriangleForward0414
import Grothe.UpperChaos.OriginalRow227TriangleForward0415

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0401 : OriginalRow227TriangleForward0401.entries.size = 32 := rfl

def entry0401 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0401.entries[i.val]'(by rw [size0401]; exact i.isLt)

theorem fields0401 (i : Fin 32) :
    (entry0401 i).IA = shift ∧ (entry0401 i).ID = S (26 + i.val + 1) ∧
      (entry0401 i).IC = S 27 ∧ (entry0401 i).Inext = T 26 (26 + i.val + 1) ∧
      (entry0401 i).Icur = T 26 (26 + i.val) ∧
      (entry0401 i).output = T 27 (26 + i.val) ∧
      (entry0401 i).charge = charge 26 (26 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0402_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0401 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (26 + i.val)) shift
      (S (26 + i.val + 1)) (S 27) (T 26 (26 + i.val + 1))
      (T 26 (26 + i.val)) (T 27 (26 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0401.entries OriginalRow227TriangleForward0401.checked
    ⟨i.val, by rw [size0401]; exact i.isLt⟩
  change (entry0401 i).check = true at h
  rcases fields0401 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0402 : OriginalRow227TriangleForward0402.entries.size = 32 := rfl

def entry0402 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0402.entries[i.val]'(by rw [size0402]; exact i.isLt)

theorem fields0402 (i : Fin 32) :
    (entry0402 i).IA = shift ∧ (entry0402 i).ID = S (58 + i.val + 1) ∧
      (entry0402 i).IC = S 27 ∧ (entry0402 i).Inext = T 26 (58 + i.val + 1) ∧
      (entry0402 i).Icur = T 26 (58 + i.val) ∧
      (entry0402 i).output = T 27 (58 + i.val) ∧
      (entry0402 i).charge = charge 26 (58 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0403_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0402 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (58 + i.val)) shift
      (S (58 + i.val + 1)) (S 27) (T 26 (58 + i.val + 1))
      (T 26 (58 + i.val)) (T 27 (58 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0402.entries OriginalRow227TriangleForward0402.checked
    ⟨i.val, by rw [size0402]; exact i.isLt⟩
  change (entry0402 i).check = true at h
  rcases fields0402 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0403 : OriginalRow227TriangleForward0403.entries.size = 32 := rfl

def entry0403 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0403.entries[i.val]'(by rw [size0403]; exact i.isLt)

theorem fields0403 (i : Fin 32) :
    (entry0403 i).IA = shift ∧ (entry0403 i).ID = S (90 + i.val + 1) ∧
      (entry0403 i).IC = S 27 ∧ (entry0403 i).Inext = T 26 (90 + i.val + 1) ∧
      (entry0403 i).Icur = T 26 (90 + i.val) ∧
      (entry0403 i).output = T 27 (90 + i.val) ∧
      (entry0403 i).charge = charge 26 (90 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0404_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0403 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (90 + i.val)) shift
      (S (90 + i.val + 1)) (S 27) (T 26 (90 + i.val + 1))
      (T 26 (90 + i.val)) (T 27 (90 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0403.entries OriginalRow227TriangleForward0403.checked
    ⟨i.val, by rw [size0403]; exact i.isLt⟩
  change (entry0403 i).check = true at h
  rcases fields0403 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0404 : OriginalRow227TriangleForward0404.entries.size = 32 := rfl

def entry0404 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0404.entries[i.val]'(by rw [size0404]; exact i.isLt)

theorem fields0404 (i : Fin 32) :
    (entry0404 i).IA = shift ∧ (entry0404 i).ID = S (122 + i.val + 1) ∧
      (entry0404 i).IC = S 27 ∧ (entry0404 i).Inext = T 26 (122 + i.val + 1) ∧
      (entry0404 i).Icur = T 26 (122 + i.val) ∧
      (entry0404 i).output = T 27 (122 + i.val) ∧
      (entry0404 i).charge = charge 26 (122 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0405_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0404 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (122 + i.val)) shift
      (S (122 + i.val + 1)) (S 27) (T 26 (122 + i.val + 1))
      (T 26 (122 + i.val)) (T 27 (122 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0404.entries OriginalRow227TriangleForward0404.checked
    ⟨i.val, by rw [size0404]; exact i.isLt⟩
  change (entry0404 i).check = true at h
  rcases fields0404 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0405 : OriginalRow227TriangleForward0405.entries.size = 32 := rfl

def entry0405 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0405.entries[i.val]'(by rw [size0405]; exact i.isLt)

theorem fields0405 (i : Fin 32) :
    (entry0405 i).IA = shift ∧ (entry0405 i).ID = S (154 + i.val + 1) ∧
      (entry0405 i).IC = S 27 ∧ (entry0405 i).Inext = T 26 (154 + i.val + 1) ∧
      (entry0405 i).Icur = T 26 (154 + i.val) ∧
      (entry0405 i).output = T 27 (154 + i.val) ∧
      (entry0405 i).charge = charge 26 (154 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0406_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0405 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (154 + i.val)) shift
      (S (154 + i.val + 1)) (S 27) (T 26 (154 + i.val + 1))
      (T 26 (154 + i.val)) (T 27 (154 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0405.entries OriginalRow227TriangleForward0405.checked
    ⟨i.val, by rw [size0405]; exact i.isLt⟩
  change (entry0405 i).check = true at h
  rcases fields0405 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0406 : OriginalRow227TriangleForward0406.entries.size = 32 := rfl

def entry0406 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0406.entries[i.val]'(by rw [size0406]; exact i.isLt)

theorem fields0406 (i : Fin 32) :
    (entry0406 i).IA = shift ∧ (entry0406 i).ID = S (186 + i.val + 1) ∧
      (entry0406 i).IC = S 27 ∧ (entry0406 i).Inext = T 26 (186 + i.val + 1) ∧
      (entry0406 i).Icur = T 26 (186 + i.val) ∧
      (entry0406 i).output = T 27 (186 + i.val) ∧
      (entry0406 i).charge = charge 26 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0407_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0406 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 27) (T 26 (186 + i.val + 1))
      (T 26 (186 + i.val)) (T 27 (186 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0406.entries OriginalRow227TriangleForward0406.checked
    ⟨i.val, by rw [size0406]; exact i.isLt⟩
  change (entry0406 i).check = true at h
  rcases fields0406 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0407 : OriginalRow227TriangleForward0407.entries.size = 32 := rfl

def entry0407 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0407.entries[i.val]'(by rw [size0407]; exact i.isLt)

theorem fields0407 (i : Fin 32) :
    (entry0407 i).IA = shift ∧ (entry0407 i).ID = S (218 + i.val + 1) ∧
      (entry0407 i).IC = S 27 ∧ (entry0407 i).Inext = T 26 (218 + i.val + 1) ∧
      (entry0407 i).Icur = T 26 (218 + i.val) ∧
      (entry0407 i).output = T 27 (218 + i.val) ∧
      (entry0407 i).charge = charge 26 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0408_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0407 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 27) (T 26 (218 + i.val + 1))
      (T 26 (218 + i.val)) (T 27 (218 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0407.entries OriginalRow227TriangleForward0407.checked
    ⟨i.val, by rw [size0407]; exact i.isLt⟩
  change (entry0407 i).check = true at h
  rcases fields0407 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0408 : OriginalRow227TriangleForward0408.entries.size = 32 := rfl

def entry0408 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0408.entries[i.val]'(by rw [size0408]; exact i.isLt)

theorem fields0408 (i : Fin 32) :
    (entry0408 i).IA = shift ∧ (entry0408 i).ID = S (250 + i.val + 1) ∧
      (entry0408 i).IC = S 27 ∧ (entry0408 i).Inext = T 26 (250 + i.val + 1) ∧
      (entry0408 i).Icur = T 26 (250 + i.val) ∧
      (entry0408 i).output = T 27 (250 + i.val) ∧
      (entry0408 i).charge = charge 26 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0409_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0408 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 27) (T 26 (250 + i.val + 1))
      (T 26 (250 + i.val)) (T 27 (250 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0408.entries OriginalRow227TriangleForward0408.checked
    ⟨i.val, by rw [size0408]; exact i.isLt⟩
  change (entry0408 i).check = true at h
  rcases fields0408 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0409 : OriginalRow227TriangleForward0409.entries.size = 32 := rfl

def entry0409 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0409.entries[i.val]'(by rw [size0409]; exact i.isLt)

theorem fields0409 (i : Fin 32) :
    (entry0409 i).IA = shift ∧ (entry0409 i).ID = S (282 + i.val + 1) ∧
      (entry0409 i).IC = S 27 ∧ (entry0409 i).Inext = T 26 (282 + i.val + 1) ∧
      (entry0409 i).Icur = T 26 (282 + i.val) ∧
      (entry0409 i).output = T 27 (282 + i.val) ∧
      (entry0409 i).charge = charge 26 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0410_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0409 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 27) (T 26 (282 + i.val + 1))
      (T 26 (282 + i.val)) (T 27 (282 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0409.entries OriginalRow227TriangleForward0409.checked
    ⟨i.val, by rw [size0409]; exact i.isLt⟩
  change (entry0409 i).check = true at h
  rcases fields0409 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0410 : OriginalRow227TriangleForward0410.entries.size = 32 := rfl

def entry0410 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0410.entries[i.val]'(by rw [size0410]; exact i.isLt)

theorem fields0410 (i : Fin 32) :
    (entry0410 i).IA = shift ∧ (entry0410 i).ID = S (314 + i.val + 1) ∧
      (entry0410 i).IC = S 27 ∧ (entry0410 i).Inext = T 26 (314 + i.val + 1) ∧
      (entry0410 i).Icur = T 26 (314 + i.val) ∧
      (entry0410 i).output = T 27 (314 + i.val) ∧
      (entry0410 i).charge = charge 26 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0411_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0410 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 27) (T 26 (314 + i.val + 1))
      (T 26 (314 + i.val)) (T 27 (314 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0410.entries OriginalRow227TriangleForward0410.checked
    ⟨i.val, by rw [size0410]; exact i.isLt⟩
  change (entry0410 i).check = true at h
  rcases fields0410 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0411 : OriginalRow227TriangleForward0411.entries.size = 32 := rfl

def entry0411 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0411.entries[i.val]'(by rw [size0411]; exact i.isLt)

theorem fields0411 (i : Fin 32) :
    (entry0411 i).IA = shift ∧ (entry0411 i).ID = S (346 + i.val + 1) ∧
      (entry0411 i).IC = S 27 ∧ (entry0411 i).Inext = T 26 (346 + i.val + 1) ∧
      (entry0411 i).Icur = T 26 (346 + i.val) ∧
      (entry0411 i).output = T 27 (346 + i.val) ∧
      (entry0411 i).charge = charge 26 (346 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0412_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0411 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (346 + i.val)) shift
      (S (346 + i.val + 1)) (S 27) (T 26 (346 + i.val + 1))
      (T 26 (346 + i.val)) (T 27 (346 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0411.entries OriginalRow227TriangleForward0411.checked
    ⟨i.val, by rw [size0411]; exact i.isLt⟩
  change (entry0411 i).check = true at h
  rcases fields0411 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0412 : OriginalRow227TriangleForward0412.entries.size = 32 := rfl

def entry0412 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0412.entries[i.val]'(by rw [size0412]; exact i.isLt)

theorem fields0412 (i : Fin 32) :
    (entry0412 i).IA = shift ∧ (entry0412 i).ID = S (378 + i.val + 1) ∧
      (entry0412 i).IC = S 27 ∧ (entry0412 i).Inext = T 26 (378 + i.val + 1) ∧
      (entry0412 i).Icur = T 26 (378 + i.val) ∧
      (entry0412 i).output = T 27 (378 + i.val) ∧
      (entry0412 i).charge = charge 26 (378 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0413_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0412 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (378 + i.val)) shift
      (S (378 + i.val + 1)) (S 27) (T 26 (378 + i.val + 1))
      (T 26 (378 + i.val)) (T 27 (378 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0412.entries OriginalRow227TriangleForward0412.checked
    ⟨i.val, by rw [size0412]; exact i.isLt⟩
  change (entry0412 i).check = true at h
  rcases fields0412 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0413 : OriginalRow227TriangleForward0413.entries.size = 32 := rfl

def entry0413 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0413.entries[i.val]'(by rw [size0413]; exact i.isLt)

theorem fields0413 (i : Fin 32) :
    (entry0413 i).IA = shift ∧ (entry0413 i).ID = S (410 + i.val + 1) ∧
      (entry0413 i).IC = S 27 ∧ (entry0413 i).Inext = T 26 (410 + i.val + 1) ∧
      (entry0413 i).Icur = T 26 (410 + i.val) ∧
      (entry0413 i).output = T 27 (410 + i.val) ∧
      (entry0413 i).charge = charge 26 (410 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0414_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0413 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (410 + i.val)) shift
      (S (410 + i.val + 1)) (S 27) (T 26 (410 + i.val + 1))
      (T 26 (410 + i.val)) (T 27 (410 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0413.entries OriginalRow227TriangleForward0413.checked
    ⟨i.val, by rw [size0413]; exact i.isLt⟩
  change (entry0413 i).check = true at h
  rcases fields0413 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0414 : OriginalRow227TriangleForward0414.entries.size = 32 := rfl

def entry0414 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0414.entries[i.val]'(by rw [size0414]; exact i.isLt)

theorem fields0414 (i : Fin 32) :
    (entry0414 i).IA = shift ∧ (entry0414 i).ID = S (442 + i.val + 1) ∧
      (entry0414 i).IC = S 27 ∧ (entry0414 i).Inext = T 26 (442 + i.val + 1) ∧
      (entry0414 i).Icur = T 26 (442 + i.val) ∧
      (entry0414 i).output = T 27 (442 + i.val) ∧
      (entry0414 i).charge = charge 26 (442 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0415_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0414 (i : Fin 32) :
    forwardStepOK (-768) (charge 26 (442 + i.val)) shift
      (S (442 + i.val + 1)) (S 27) (T 26 (442 + i.val + 1))
      (T 26 (442 + i.val)) (T 27 (442 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0414.entries OriginalRow227TriangleForward0414.checked
    ⟨i.val, by rw [size0414]; exact i.isLt⟩
  change (entry0414 i).check = true at h
  rcases fields0414 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0415 : OriginalRow227TriangleForward0415.entries.size = 1 := rfl

def entry0415 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0415.entries[i.val]'(by rw [size0415]; exact i.isLt)

theorem fields0415 (i : Fin 1) :
    (entry0415 i).IA = shift ∧ (entry0415 i).ID = S (474 + i.val + 1) ∧
      (entry0415 i).IC = S 27 ∧ (entry0415 i).Inext = T 26 (474 + i.val + 1) ∧
      (entry0415 i).Icur = T 26 (474 + i.val) ∧
      (entry0415 i).output = T 27 (474 + i.val) ∧
      (entry0415 i).charge = charge 26 (474 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow026.block0416_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0431_value ⟨0, by decide⟩).symm, rfl⟩

theorem step0415 (i : Fin 1) :
    forwardStepOK (-768) (charge 26 (474 + i.val)) shift
      (S (474 + i.val + 1)) (S 27) (T 26 (474 + i.val + 1))
      (T 26 (474 + i.val)) (T 27 (474 + i.val))
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0415.entries OriginalRow227TriangleForward0415.checked
    ⟨i.val, by rw [size0415]; exact i.isLt⟩
  change (entry0415 i).check = true at h
  rcases fields0415 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 26 ≤ d) (hhi : d < 475) :
    forwardStepOK (-768) (charge 26 d) shift (S (d + 1)) (S 27)
      (T 26 (d + 1)) (T 26 d) (T 27 d)
      (OriginalRow227Roots.root_pos 27 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 26 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h122 : d < 122
    ·
      by_cases h58 : d < 58
      ·
        have hi : d - 26 < 32 := by omega
        have heq : 26 + (d - 26) = d := by omega
        simpa only [heq] using step0401 ⟨d - 26, hi⟩
      ·
        by_cases h90 : d < 90
        ·
          have hi : d - 58 < 32 := by omega
          have heq : 58 + (d - 58) = d := by omega
          simpa only [heq] using step0402 ⟨d - 58, hi⟩
        ·
          have hi : d - 90 < 32 := by omega
          have heq : 90 + (d - 90) = d := by omega
          simpa only [heq] using step0403 ⟨d - 90, hi⟩
    ·
      by_cases h186 : d < 186
      ·
        by_cases h154 : d < 154
        ·
          have hi : d - 122 < 32 := by omega
          have heq : 122 + (d - 122) = d := by omega
          simpa only [heq] using step0404 ⟨d - 122, hi⟩
        ·
          have hi : d - 154 < 32 := by omega
          have heq : 154 + (d - 154) = d := by omega
          simpa only [heq] using step0405 ⟨d - 154, hi⟩
      ·
        by_cases h218 : d < 218
        ·
          have hi : d - 186 < 32 := by omega
          have heq : 186 + (d - 186) = d := by omega
          simpa only [heq] using step0406 ⟨d - 186, hi⟩
        ·
          have hi : d - 218 < 32 := by omega
          have heq : 218 + (d - 218) = d := by omega
          simpa only [heq] using step0407 ⟨d - 218, hi⟩
  ·
    by_cases h378 : d < 378
    ·
      by_cases h314 : d < 314
      ·
        by_cases h282 : d < 282
        ·
          have hi : d - 250 < 32 := by omega
          have heq : 250 + (d - 250) = d := by omega
          simpa only [heq] using step0408 ⟨d - 250, hi⟩
        ·
          have hi : d - 282 < 32 := by omega
          have heq : 282 + (d - 282) = d := by omega
          simpa only [heq] using step0409 ⟨d - 282, hi⟩
      ·
        by_cases h346 : d < 346
        ·
          have hi : d - 314 < 32 := by omega
          have heq : 314 + (d - 314) = d := by omega
          simpa only [heq] using step0410 ⟨d - 314, hi⟩
        ·
          have hi : d - 346 < 32 := by omega
          have heq : 346 + (d - 346) = d := by omega
          simpa only [heq] using step0411 ⟨d - 346, hi⟩
    ·
      by_cases h442 : d < 442
      ·
        by_cases h410 : d < 410
        ·
          have hi : d - 378 < 32 := by omega
          have heq : 378 + (d - 378) = d := by omega
          simpa only [heq] using step0412 ⟨d - 378, hi⟩
        ·
          have hi : d - 410 < 32 := by omega
          have heq : 410 + (d - 410) = d := by omega
          simpa only [heq] using step0413 ⟨d - 410, hi⟩
      ·
        by_cases h474 : d < 474
        ·
          have hi : d - 442 < 32 := by omega
          have heq : 442 + (d - 442) = d := by omega
          simpa only [heq] using step0414 ⟨d - 442, hi⟩
        ·
          have hi : d - 474 < 1 := by omega
          have heq : 474 + (d - 474) = d := by omega
          simpa only [heq] using step0415 ⟨d - 474, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0401,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0401,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0402,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0402,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0403,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0403,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0404,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0404,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0405,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0405,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0406,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0406,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0407,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0407,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0408,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0408,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0409,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0409,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0410,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0410,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0411,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0411,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0412,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0412,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0413,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0413,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0414,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0414,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.fields0415,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.step0415,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow027
