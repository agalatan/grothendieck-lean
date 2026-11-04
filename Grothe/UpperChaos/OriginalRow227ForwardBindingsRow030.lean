import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030
import Grothe.UpperChaos.OriginalRow227TriangleForward0444
import Grothe.UpperChaos.OriginalRow227TriangleForward0445
import Grothe.UpperChaos.OriginalRow227TriangleForward0446
import Grothe.UpperChaos.OriginalRow227TriangleForward0447
import Grothe.UpperChaos.OriginalRow227TriangleForward0448
import Grothe.UpperChaos.OriginalRow227TriangleForward0449
import Grothe.UpperChaos.OriginalRow227TriangleForward0450
import Grothe.UpperChaos.OriginalRow227TriangleForward0451
import Grothe.UpperChaos.OriginalRow227TriangleForward0452
import Grothe.UpperChaos.OriginalRow227TriangleForward0453
import Grothe.UpperChaos.OriginalRow227TriangleForward0454
import Grothe.UpperChaos.OriginalRow227TriangleForward0455
import Grothe.UpperChaos.OriginalRow227TriangleForward0456
import Grothe.UpperChaos.OriginalRow227TriangleForward0457

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0444 : OriginalRow227TriangleForward0444.entries.size = 32 := rfl

def entry0444 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0444.entries[i.val]'(by rw [size0444]; exact i.isLt)

theorem fields0444 (i : Fin 32) :
    (entry0444 i).IA = shift ∧ (entry0444 i).ID = S (29 + i.val + 1) ∧
      (entry0444 i).IC = S 30 ∧ (entry0444 i).Inext = T 29 (29 + i.val + 1) ∧
      (entry0444 i).Icur = T 29 (29 + i.val) ∧
      (entry0444 i).output = T 30 (29 + i.val) ∧
      (entry0444 i).charge = charge 29 (29 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0444 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (29 + i.val)) shift
      (S (29 + i.val + 1)) (S 30) (T 29 (29 + i.val + 1))
      (T 29 (29 + i.val)) (T 30 (29 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0444.entries OriginalRow227TriangleForward0444.checked
    ⟨i.val, by rw [size0444]; exact i.isLt⟩
  change (entry0444 i).check = true at h
  rcases fields0444 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0445 : OriginalRow227TriangleForward0445.entries.size = 32 := rfl

def entry0445 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0445.entries[i.val]'(by rw [size0445]; exact i.isLt)

theorem fields0445 (i : Fin 32) :
    (entry0445 i).IA = shift ∧ (entry0445 i).ID = S (61 + i.val + 1) ∧
      (entry0445 i).IC = S 30 ∧ (entry0445 i).Inext = T 29 (61 + i.val + 1) ∧
      (entry0445 i).Icur = T 29 (61 + i.val) ∧
      (entry0445 i).output = T 30 (61 + i.val) ∧
      (entry0445 i).charge = charge 29 (61 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0445 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (61 + i.val)) shift
      (S (61 + i.val + 1)) (S 30) (T 29 (61 + i.val + 1))
      (T 29 (61 + i.val)) (T 30 (61 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0445.entries OriginalRow227TriangleForward0445.checked
    ⟨i.val, by rw [size0445]; exact i.isLt⟩
  change (entry0445 i).check = true at h
  rcases fields0445 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0446 : OriginalRow227TriangleForward0446.entries.size = 32 := rfl

def entry0446 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0446.entries[i.val]'(by rw [size0446]; exact i.isLt)

theorem fields0446 (i : Fin 32) :
    (entry0446 i).IA = shift ∧ (entry0446 i).ID = S (93 + i.val + 1) ∧
      (entry0446 i).IC = S 30 ∧ (entry0446 i).Inext = T 29 (93 + i.val + 1) ∧
      (entry0446 i).Icur = T 29 (93 + i.val) ∧
      (entry0446 i).output = T 30 (93 + i.val) ∧
      (entry0446 i).charge = charge 29 (93 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0446 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (93 + i.val)) shift
      (S (93 + i.val + 1)) (S 30) (T 29 (93 + i.val + 1))
      (T 29 (93 + i.val)) (T 30 (93 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0446.entries OriginalRow227TriangleForward0446.checked
    ⟨i.val, by rw [size0446]; exact i.isLt⟩
  change (entry0446 i).check = true at h
  rcases fields0446 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0447 : OriginalRow227TriangleForward0447.entries.size = 32 := rfl

def entry0447 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0447.entries[i.val]'(by rw [size0447]; exact i.isLt)

theorem fields0447 (i : Fin 32) :
    (entry0447 i).IA = shift ∧ (entry0447 i).ID = S (125 + i.val + 1) ∧
      (entry0447 i).IC = S 30 ∧ (entry0447 i).Inext = T 29 (125 + i.val + 1) ∧
      (entry0447 i).Icur = T 29 (125 + i.val) ∧
      (entry0447 i).output = T 30 (125 + i.val) ∧
      (entry0447 i).charge = charge 29 (125 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0447 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (125 + i.val)) shift
      (S (125 + i.val + 1)) (S 30) (T 29 (125 + i.val + 1))
      (T 29 (125 + i.val)) (T 30 (125 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0447.entries OriginalRow227TriangleForward0447.checked
    ⟨i.val, by rw [size0447]; exact i.isLt⟩
  change (entry0447 i).check = true at h
  rcases fields0447 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0448 : OriginalRow227TriangleForward0448.entries.size = 32 := rfl

def entry0448 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0448.entries[i.val]'(by rw [size0448]; exact i.isLt)

theorem fields0448 (i : Fin 32) :
    (entry0448 i).IA = shift ∧ (entry0448 i).ID = S (157 + i.val + 1) ∧
      (entry0448 i).IC = S 30 ∧ (entry0448 i).Inext = T 29 (157 + i.val + 1) ∧
      (entry0448 i).Icur = T 29 (157 + i.val) ∧
      (entry0448 i).output = T 30 (157 + i.val) ∧
      (entry0448 i).charge = charge 29 (157 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0448 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (157 + i.val)) shift
      (S (157 + i.val + 1)) (S 30) (T 29 (157 + i.val + 1))
      (T 29 (157 + i.val)) (T 30 (157 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0448.entries OriginalRow227TriangleForward0448.checked
    ⟨i.val, by rw [size0448]; exact i.isLt⟩
  change (entry0448 i).check = true at h
  rcases fields0448 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0449 : OriginalRow227TriangleForward0449.entries.size = 32 := rfl

def entry0449 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0449.entries[i.val]'(by rw [size0449]; exact i.isLt)

theorem fields0449 (i : Fin 32) :
    (entry0449 i).IA = shift ∧ (entry0449 i).ID = S (189 + i.val + 1) ∧
      (entry0449 i).IC = S 30 ∧ (entry0449 i).Inext = T 29 (189 + i.val + 1) ∧
      (entry0449 i).Icur = T 29 (189 + i.val) ∧
      (entry0449 i).output = T 30 (189 + i.val) ∧
      (entry0449 i).charge = charge 29 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0449 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 30) (T 29 (189 + i.val + 1))
      (T 29 (189 + i.val)) (T 30 (189 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0449.entries OriginalRow227TriangleForward0449.checked
    ⟨i.val, by rw [size0449]; exact i.isLt⟩
  change (entry0449 i).check = true at h
  rcases fields0449 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0450 : OriginalRow227TriangleForward0450.entries.size = 32 := rfl

def entry0450 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0450.entries[i.val]'(by rw [size0450]; exact i.isLt)

theorem fields0450 (i : Fin 32) :
    (entry0450 i).IA = shift ∧ (entry0450 i).ID = S (221 + i.val + 1) ∧
      (entry0450 i).IC = S 30 ∧ (entry0450 i).Inext = T 29 (221 + i.val + 1) ∧
      (entry0450 i).Icur = T 29 (221 + i.val) ∧
      (entry0450 i).output = T 30 (221 + i.val) ∧
      (entry0450 i).charge = charge 29 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0450 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 30) (T 29 (221 + i.val + 1))
      (T 29 (221 + i.val)) (T 30 (221 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0450.entries OriginalRow227TriangleForward0450.checked
    ⟨i.val, by rw [size0450]; exact i.isLt⟩
  change (entry0450 i).check = true at h
  rcases fields0450 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0451 : OriginalRow227TriangleForward0451.entries.size = 32 := rfl

def entry0451 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0451.entries[i.val]'(by rw [size0451]; exact i.isLt)

theorem fields0451 (i : Fin 32) :
    (entry0451 i).IA = shift ∧ (entry0451 i).ID = S (253 + i.val + 1) ∧
      (entry0451 i).IC = S 30 ∧ (entry0451 i).Inext = T 29 (253 + i.val + 1) ∧
      (entry0451 i).Icur = T 29 (253 + i.val) ∧
      (entry0451 i).output = T 30 (253 + i.val) ∧
      (entry0451 i).charge = charge 29 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0451 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 30) (T 29 (253 + i.val + 1))
      (T 29 (253 + i.val)) (T 30 (253 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0451.entries OriginalRow227TriangleForward0451.checked
    ⟨i.val, by rw [size0451]; exact i.isLt⟩
  change (entry0451 i).check = true at h
  rcases fields0451 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0452 : OriginalRow227TriangleForward0452.entries.size = 32 := rfl

def entry0452 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0452.entries[i.val]'(by rw [size0452]; exact i.isLt)

theorem fields0452 (i : Fin 32) :
    (entry0452 i).IA = shift ∧ (entry0452 i).ID = S (285 + i.val + 1) ∧
      (entry0452 i).IC = S 30 ∧ (entry0452 i).Inext = T 29 (285 + i.val + 1) ∧
      (entry0452 i).Icur = T 29 (285 + i.val) ∧
      (entry0452 i).output = T 30 (285 + i.val) ∧
      (entry0452 i).charge = charge 29 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0452 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 30) (T 29 (285 + i.val + 1))
      (T 29 (285 + i.val)) (T 30 (285 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0452.entries OriginalRow227TriangleForward0452.checked
    ⟨i.val, by rw [size0452]; exact i.isLt⟩
  change (entry0452 i).check = true at h
  rcases fields0452 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0453 : OriginalRow227TriangleForward0453.entries.size = 32 := rfl

def entry0453 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0453.entries[i.val]'(by rw [size0453]; exact i.isLt)

theorem fields0453 (i : Fin 32) :
    (entry0453 i).IA = shift ∧ (entry0453 i).ID = S (317 + i.val + 1) ∧
      (entry0453 i).IC = S 30 ∧ (entry0453 i).Inext = T 29 (317 + i.val + 1) ∧
      (entry0453 i).Icur = T 29 (317 + i.val) ∧
      (entry0453 i).output = T 30 (317 + i.val) ∧
      (entry0453 i).charge = charge 29 (317 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0453 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (317 + i.val)) shift
      (S (317 + i.val + 1)) (S 30) (T 29 (317 + i.val + 1))
      (T 29 (317 + i.val)) (T 30 (317 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0453.entries OriginalRow227TriangleForward0453.checked
    ⟨i.val, by rw [size0453]; exact i.isLt⟩
  change (entry0453 i).check = true at h
  rcases fields0453 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0454 : OriginalRow227TriangleForward0454.entries.size = 32 := rfl

def entry0454 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0454.entries[i.val]'(by rw [size0454]; exact i.isLt)

theorem fields0454 (i : Fin 32) :
    (entry0454 i).IA = shift ∧ (entry0454 i).ID = S (349 + i.val + 1) ∧
      (entry0454 i).IC = S 30 ∧ (entry0454 i).Inext = T 29 (349 + i.val + 1) ∧
      (entry0454 i).Icur = T 29 (349 + i.val) ∧
      (entry0454 i).output = T 30 (349 + i.val) ∧
      (entry0454 i).charge = charge 29 (349 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0454 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (349 + i.val)) shift
      (S (349 + i.val + 1)) (S 30) (T 29 (349 + i.val + 1))
      (T 29 (349 + i.val)) (T 30 (349 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0454.entries OriginalRow227TriangleForward0454.checked
    ⟨i.val, by rw [size0454]; exact i.isLt⟩
  change (entry0454 i).check = true at h
  rcases fields0454 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0455 : OriginalRow227TriangleForward0455.entries.size = 32 := rfl

def entry0455 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0455.entries[i.val]'(by rw [size0455]; exact i.isLt)

theorem fields0455 (i : Fin 32) :
    (entry0455 i).IA = shift ∧ (entry0455 i).ID = S (381 + i.val + 1) ∧
      (entry0455 i).IC = S 30 ∧ (entry0455 i).Inext = T 29 (381 + i.val + 1) ∧
      (entry0455 i).Icur = T 29 (381 + i.val) ∧
      (entry0455 i).output = T 30 (381 + i.val) ∧
      (entry0455 i).charge = charge 29 (381 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0455 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (381 + i.val)) shift
      (S (381 + i.val + 1)) (S 30) (T 29 (381 + i.val + 1))
      (T 29 (381 + i.val)) (T 30 (381 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0455.entries OriginalRow227TriangleForward0455.checked
    ⟨i.val, by rw [size0455]; exact i.isLt⟩
  change (entry0455 i).check = true at h
  rcases fields0455 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0456 : OriginalRow227TriangleForward0456.entries.size = 32 := rfl

def entry0456 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0456.entries[i.val]'(by rw [size0456]; exact i.isLt)

theorem fields0456 (i : Fin 32) :
    (entry0456 i).IA = shift ∧ (entry0456 i).ID = S (413 + i.val + 1) ∧
      (entry0456 i).IC = S 30 ∧ (entry0456 i).Inext = T 29 (413 + i.val + 1) ∧
      (entry0456 i).Icur = T 29 (413 + i.val) ∧
      (entry0456 i).output = T 30 (413 + i.val) ∧
      (entry0456 i).charge = charge 29 (413 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0456 (i : Fin 32) :
    forwardStepOK (-768) (charge 29 (413 + i.val)) shift
      (S (413 + i.val + 1)) (S 30) (T 29 (413 + i.val + 1))
      (T 29 (413 + i.val)) (T 30 (413 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0456.entries OriginalRow227TriangleForward0456.checked
    ⟨i.val, by rw [size0456]; exact i.isLt⟩
  change (entry0456 i).check = true at h
  rcases fields0456 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0457 : OriginalRow227TriangleForward0457.entries.size = 27 := rfl

def entry0457 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0457.entries[i.val]'(by rw [size0457]; exact i.isLt)

theorem fields0457 (i : Fin 27) :
    (entry0457 i).IA = shift ∧ (entry0457 i).ID = S (445 + i.val + 1) ∧
      (entry0457 i).IC = S 30 ∧ (entry0457 i).Inext = T 29 (445 + i.val + 1) ∧
      (entry0457 i).Icur = T 29 (445 + i.val) ∧
      (entry0457 i).output = T 30 (445 + i.val) ∧
      (entry0457 i).charge = charge 29 (445 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨26, by decide⟩).symm, rfl⟩

theorem step0457 (i : Fin 27) :
    forwardStepOK (-768) (charge 29 (445 + i.val)) shift
      (S (445 + i.val + 1)) (S 30) (T 29 (445 + i.val + 1))
      (T 29 (445 + i.val)) (T 30 (445 + i.val))
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0457.entries OriginalRow227TriangleForward0457.checked
    ⟨i.val, by rw [size0457]; exact i.isLt⟩
  change (entry0457 i).check = true at h
  rcases fields0457 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 29 ≤ d) (hhi : d < 472) :
    forwardStepOK (-768) (charge 29 d) shift (S (d + 1)) (S 30)
      (T 29 (d + 1)) (T 29 d) (T 30 d)
      (OriginalRow227Roots.root_pos 30 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 29 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h125 : d < 125
    ·
      by_cases h61 : d < 61
      ·
        have hi : d - 29 < 32 := by omega
        have heq : 29 + (d - 29) = d := by omega
        simpa only [heq] using step0444 ⟨d - 29, hi⟩
      ·
        by_cases h93 : d < 93
        ·
          have hi : d - 61 < 32 := by omega
          have heq : 61 + (d - 61) = d := by omega
          simpa only [heq] using step0445 ⟨d - 61, hi⟩
        ·
          have hi : d - 93 < 32 := by omega
          have heq : 93 + (d - 93) = d := by omega
          simpa only [heq] using step0446 ⟨d - 93, hi⟩
    ·
      by_cases h189 : d < 189
      ·
        by_cases h157 : d < 157
        ·
          have hi : d - 125 < 32 := by omega
          have heq : 125 + (d - 125) = d := by omega
          simpa only [heq] using step0447 ⟨d - 125, hi⟩
        ·
          have hi : d - 157 < 32 := by omega
          have heq : 157 + (d - 157) = d := by omega
          simpa only [heq] using step0448 ⟨d - 157, hi⟩
      ·
        by_cases h221 : d < 221
        ·
          have hi : d - 189 < 32 := by omega
          have heq : 189 + (d - 189) = d := by omega
          simpa only [heq] using step0449 ⟨d - 189, hi⟩
        ·
          have hi : d - 221 < 32 := by omega
          have heq : 221 + (d - 221) = d := by omega
          simpa only [heq] using step0450 ⟨d - 221, hi⟩
  ·
    by_cases h349 : d < 349
    ·
      by_cases h285 : d < 285
      ·
        have hi : d - 253 < 32 := by omega
        have heq : 253 + (d - 253) = d := by omega
        simpa only [heq] using step0451 ⟨d - 253, hi⟩
      ·
        by_cases h317 : d < 317
        ·
          have hi : d - 285 < 32 := by omega
          have heq : 285 + (d - 285) = d := by omega
          simpa only [heq] using step0452 ⟨d - 285, hi⟩
        ·
          have hi : d - 317 < 32 := by omega
          have heq : 317 + (d - 317) = d := by omega
          simpa only [heq] using step0453 ⟨d - 317, hi⟩
    ·
      by_cases h413 : d < 413
      ·
        by_cases h381 : d < 381
        ·
          have hi : d - 349 < 32 := by omega
          have heq : 349 + (d - 349) = d := by omega
          simpa only [heq] using step0454 ⟨d - 349, hi⟩
        ·
          have hi : d - 381 < 32 := by omega
          have heq : 381 + (d - 381) = d := by omega
          simpa only [heq] using step0455 ⟨d - 381, hi⟩
      ·
        by_cases h445 : d < 445
        ·
          have hi : d - 413 < 32 := by omega
          have heq : 413 + (d - 413) = d := by omega
          simpa only [heq] using step0456 ⟨d - 413, hi⟩
        ·
          have hi : d - 445 < 27 := by omega
          have heq : 445 + (d - 445) = d := by omega
          simpa only [heq] using step0457 ⟨d - 445, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0444,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0444,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0445,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0445,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0446,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0446,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0447,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0447,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0448,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0448,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0449,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0449,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0450,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0450,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0451,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0451,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0452,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0452,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0453,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0453,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0454,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0454,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0455,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0455,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0456,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0456,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.fields0457,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.step0457,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow030
