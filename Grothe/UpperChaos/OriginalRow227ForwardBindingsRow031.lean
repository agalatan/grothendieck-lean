import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031
import Grothe.UpperChaos.OriginalRow227TriangleForward0458
import Grothe.UpperChaos.OriginalRow227TriangleForward0459
import Grothe.UpperChaos.OriginalRow227TriangleForward0460
import Grothe.UpperChaos.OriginalRow227TriangleForward0461
import Grothe.UpperChaos.OriginalRow227TriangleForward0462
import Grothe.UpperChaos.OriginalRow227TriangleForward0463
import Grothe.UpperChaos.OriginalRow227TriangleForward0464
import Grothe.UpperChaos.OriginalRow227TriangleForward0465
import Grothe.UpperChaos.OriginalRow227TriangleForward0466
import Grothe.UpperChaos.OriginalRow227TriangleForward0467
import Grothe.UpperChaos.OriginalRow227TriangleForward0468
import Grothe.UpperChaos.OriginalRow227TriangleForward0469
import Grothe.UpperChaos.OriginalRow227TriangleForward0470
import Grothe.UpperChaos.OriginalRow227TriangleForward0471

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0458 : OriginalRow227TriangleForward0458.entries.size = 32 := rfl

def entry0458 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0458.entries[i.val]'(by rw [size0458]; exact i.isLt)

theorem fields0458 (i : Fin 32) :
    (entry0458 i).IA = shift ∧ (entry0458 i).ID = S (30 + i.val + 1) ∧
      (entry0458 i).IC = S 31 ∧ (entry0458 i).Inext = T 30 (30 + i.val + 1) ∧
      (entry0458 i).Icur = T 30 (30 + i.val) ∧
      (entry0458 i).output = T 31 (30 + i.val) ∧
      (entry0458 i).charge = charge 30 (30 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0460_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0458 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (30 + i.val)) shift
      (S (30 + i.val + 1)) (S 31) (T 30 (30 + i.val + 1))
      (T 30 (30 + i.val)) (T 31 (30 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0458.entries OriginalRow227TriangleForward0458.checked
    ⟨i.val, by rw [size0458]; exact i.isLt⟩
  change (entry0458 i).check = true at h
  rcases fields0458 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0459 : OriginalRow227TriangleForward0459.entries.size = 32 := rfl

def entry0459 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0459.entries[i.val]'(by rw [size0459]; exact i.isLt)

theorem fields0459 (i : Fin 32) :
    (entry0459 i).IA = shift ∧ (entry0459 i).ID = S (62 + i.val + 1) ∧
      (entry0459 i).IC = S 31 ∧ (entry0459 i).Inext = T 30 (62 + i.val + 1) ∧
      (entry0459 i).Icur = T 30 (62 + i.val) ∧
      (entry0459 i).output = T 31 (62 + i.val) ∧
      (entry0459 i).charge = charge 30 (62 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0461_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0459 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (62 + i.val)) shift
      (S (62 + i.val + 1)) (S 31) (T 30 (62 + i.val + 1))
      (T 30 (62 + i.val)) (T 31 (62 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0459.entries OriginalRow227TriangleForward0459.checked
    ⟨i.val, by rw [size0459]; exact i.isLt⟩
  change (entry0459 i).check = true at h
  rcases fields0459 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0460 : OriginalRow227TriangleForward0460.entries.size = 32 := rfl

def entry0460 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0460.entries[i.val]'(by rw [size0460]; exact i.isLt)

theorem fields0460 (i : Fin 32) :
    (entry0460 i).IA = shift ∧ (entry0460 i).ID = S (94 + i.val + 1) ∧
      (entry0460 i).IC = S 31 ∧ (entry0460 i).Inext = T 30 (94 + i.val + 1) ∧
      (entry0460 i).Icur = T 30 (94 + i.val) ∧
      (entry0460 i).output = T 31 (94 + i.val) ∧
      (entry0460 i).charge = charge 30 (94 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0462_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0460 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (94 + i.val)) shift
      (S (94 + i.val + 1)) (S 31) (T 30 (94 + i.val + 1))
      (T 30 (94 + i.val)) (T 31 (94 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0460.entries OriginalRow227TriangleForward0460.checked
    ⟨i.val, by rw [size0460]; exact i.isLt⟩
  change (entry0460 i).check = true at h
  rcases fields0460 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0461 : OriginalRow227TriangleForward0461.entries.size = 32 := rfl

def entry0461 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0461.entries[i.val]'(by rw [size0461]; exact i.isLt)

theorem fields0461 (i : Fin 32) :
    (entry0461 i).IA = shift ∧ (entry0461 i).ID = S (126 + i.val + 1) ∧
      (entry0461 i).IC = S 31 ∧ (entry0461 i).Inext = T 30 (126 + i.val + 1) ∧
      (entry0461 i).Icur = T 30 (126 + i.val) ∧
      (entry0461 i).output = T 31 (126 + i.val) ∧
      (entry0461 i).charge = charge 30 (126 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0463_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0461 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (126 + i.val)) shift
      (S (126 + i.val + 1)) (S 31) (T 30 (126 + i.val + 1))
      (T 30 (126 + i.val)) (T 31 (126 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0461.entries OriginalRow227TriangleForward0461.checked
    ⟨i.val, by rw [size0461]; exact i.isLt⟩
  change (entry0461 i).check = true at h
  rcases fields0461 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0462 : OriginalRow227TriangleForward0462.entries.size = 32 := rfl

def entry0462 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0462.entries[i.val]'(by rw [size0462]; exact i.isLt)

theorem fields0462 (i : Fin 32) :
    (entry0462 i).IA = shift ∧ (entry0462 i).ID = S (158 + i.val + 1) ∧
      (entry0462 i).IC = S 31 ∧ (entry0462 i).Inext = T 30 (158 + i.val + 1) ∧
      (entry0462 i).Icur = T 30 (158 + i.val) ∧
      (entry0462 i).output = T 31 (158 + i.val) ∧
      (entry0462 i).charge = charge 30 (158 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0464_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0462 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (158 + i.val)) shift
      (S (158 + i.val + 1)) (S 31) (T 30 (158 + i.val + 1))
      (T 30 (158 + i.val)) (T 31 (158 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0462.entries OriginalRow227TriangleForward0462.checked
    ⟨i.val, by rw [size0462]; exact i.isLt⟩
  change (entry0462 i).check = true at h
  rcases fields0462 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0463 : OriginalRow227TriangleForward0463.entries.size = 32 := rfl

def entry0463 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0463.entries[i.val]'(by rw [size0463]; exact i.isLt)

theorem fields0463 (i : Fin 32) :
    (entry0463 i).IA = shift ∧ (entry0463 i).ID = S (190 + i.val + 1) ∧
      (entry0463 i).IC = S 31 ∧ (entry0463 i).Inext = T 30 (190 + i.val + 1) ∧
      (entry0463 i).Icur = T 30 (190 + i.val) ∧
      (entry0463 i).output = T 31 (190 + i.val) ∧
      (entry0463 i).charge = charge 30 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0465_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0463 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 31) (T 30 (190 + i.val + 1))
      (T 30 (190 + i.val)) (T 31 (190 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0463.entries OriginalRow227TriangleForward0463.checked
    ⟨i.val, by rw [size0463]; exact i.isLt⟩
  change (entry0463 i).check = true at h
  rcases fields0463 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0464 : OriginalRow227TriangleForward0464.entries.size = 32 := rfl

def entry0464 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0464.entries[i.val]'(by rw [size0464]; exact i.isLt)

theorem fields0464 (i : Fin 32) :
    (entry0464 i).IA = shift ∧ (entry0464 i).ID = S (222 + i.val + 1) ∧
      (entry0464 i).IC = S 31 ∧ (entry0464 i).Inext = T 30 (222 + i.val + 1) ∧
      (entry0464 i).Icur = T 30 (222 + i.val) ∧
      (entry0464 i).output = T 31 (222 + i.val) ∧
      (entry0464 i).charge = charge 30 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0466_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0464 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 31) (T 30 (222 + i.val + 1))
      (T 30 (222 + i.val)) (T 31 (222 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0464.entries OriginalRow227TriangleForward0464.checked
    ⟨i.val, by rw [size0464]; exact i.isLt⟩
  change (entry0464 i).check = true at h
  rcases fields0464 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0465 : OriginalRow227TriangleForward0465.entries.size = 32 := rfl

def entry0465 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0465.entries[i.val]'(by rw [size0465]; exact i.isLt)

theorem fields0465 (i : Fin 32) :
    (entry0465 i).IA = shift ∧ (entry0465 i).ID = S (254 + i.val + 1) ∧
      (entry0465 i).IC = S 31 ∧ (entry0465 i).Inext = T 30 (254 + i.val + 1) ∧
      (entry0465 i).Icur = T 30 (254 + i.val) ∧
      (entry0465 i).output = T 31 (254 + i.val) ∧
      (entry0465 i).charge = charge 30 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0467_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0465 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 31) (T 30 (254 + i.val + 1))
      (T 30 (254 + i.val)) (T 31 (254 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0465.entries OriginalRow227TriangleForward0465.checked
    ⟨i.val, by rw [size0465]; exact i.isLt⟩
  change (entry0465 i).check = true at h
  rcases fields0465 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0466 : OriginalRow227TriangleForward0466.entries.size = 32 := rfl

def entry0466 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0466.entries[i.val]'(by rw [size0466]; exact i.isLt)

theorem fields0466 (i : Fin 32) :
    (entry0466 i).IA = shift ∧ (entry0466 i).ID = S (286 + i.val + 1) ∧
      (entry0466 i).IC = S 31 ∧ (entry0466 i).Inext = T 30 (286 + i.val + 1) ∧
      (entry0466 i).Icur = T 30 (286 + i.val) ∧
      (entry0466 i).output = T 31 (286 + i.val) ∧
      (entry0466 i).charge = charge 30 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0468_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0466 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 31) (T 30 (286 + i.val + 1))
      (T 30 (286 + i.val)) (T 31 (286 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0466.entries OriginalRow227TriangleForward0466.checked
    ⟨i.val, by rw [size0466]; exact i.isLt⟩
  change (entry0466 i).check = true at h
  rcases fields0466 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0467 : OriginalRow227TriangleForward0467.entries.size = 32 := rfl

def entry0467 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0467.entries[i.val]'(by rw [size0467]; exact i.isLt)

theorem fields0467 (i : Fin 32) :
    (entry0467 i).IA = shift ∧ (entry0467 i).ID = S (318 + i.val + 1) ∧
      (entry0467 i).IC = S 31 ∧ (entry0467 i).Inext = T 30 (318 + i.val + 1) ∧
      (entry0467 i).Icur = T 30 (318 + i.val) ∧
      (entry0467 i).output = T 31 (318 + i.val) ∧
      (entry0467 i).charge = charge 30 (318 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0469_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0467 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (318 + i.val)) shift
      (S (318 + i.val + 1)) (S 31) (T 30 (318 + i.val + 1))
      (T 30 (318 + i.val)) (T 31 (318 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0467.entries OriginalRow227TriangleForward0467.checked
    ⟨i.val, by rw [size0467]; exact i.isLt⟩
  change (entry0467 i).check = true at h
  rcases fields0467 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0468 : OriginalRow227TriangleForward0468.entries.size = 32 := rfl

def entry0468 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0468.entries[i.val]'(by rw [size0468]; exact i.isLt)

theorem fields0468 (i : Fin 32) :
    (entry0468 i).IA = shift ∧ (entry0468 i).ID = S (350 + i.val + 1) ∧
      (entry0468 i).IC = S 31 ∧ (entry0468 i).Inext = T 30 (350 + i.val + 1) ∧
      (entry0468 i).Icur = T 30 (350 + i.val) ∧
      (entry0468 i).output = T 31 (350 + i.val) ∧
      (entry0468 i).charge = charge 30 (350 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0470_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0468 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (350 + i.val)) shift
      (S (350 + i.val + 1)) (S 31) (T 30 (350 + i.val + 1))
      (T 30 (350 + i.val)) (T 31 (350 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0468.entries OriginalRow227TriangleForward0468.checked
    ⟨i.val, by rw [size0468]; exact i.isLt⟩
  change (entry0468 i).check = true at h
  rcases fields0468 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0469 : OriginalRow227TriangleForward0469.entries.size = 32 := rfl

def entry0469 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0469.entries[i.val]'(by rw [size0469]; exact i.isLt)

theorem fields0469 (i : Fin 32) :
    (entry0469 i).IA = shift ∧ (entry0469 i).ID = S (382 + i.val + 1) ∧
      (entry0469 i).IC = S 31 ∧ (entry0469 i).Inext = T 30 (382 + i.val + 1) ∧
      (entry0469 i).Icur = T 30 (382 + i.val) ∧
      (entry0469 i).output = T 31 (382 + i.val) ∧
      (entry0469 i).charge = charge 30 (382 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0471_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0469 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (382 + i.val)) shift
      (S (382 + i.val + 1)) (S 31) (T 30 (382 + i.val + 1))
      (T 30 (382 + i.val)) (T 31 (382 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0469.entries OriginalRow227TriangleForward0469.checked
    ⟨i.val, by rw [size0469]; exact i.isLt⟩
  change (entry0469 i).check = true at h
  rcases fields0469 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0470 : OriginalRow227TriangleForward0470.entries.size = 32 := rfl

def entry0470 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0470.entries[i.val]'(by rw [size0470]; exact i.isLt)

theorem fields0470 (i : Fin 32) :
    (entry0470 i).IA = shift ∧ (entry0470 i).ID = S (414 + i.val + 1) ∧
      (entry0470 i).IC = S 31 ∧ (entry0470 i).Inext = T 30 (414 + i.val + 1) ∧
      (entry0470 i).Icur = T 30 (414 + i.val) ∧
      (entry0470 i).output = T 31 (414 + i.val) ∧
      (entry0470 i).charge = charge 30 (414 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0472_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0470 (i : Fin 32) :
    forwardStepOK (-768) (charge 30 (414 + i.val)) shift
      (S (414 + i.val + 1)) (S 31) (T 30 (414 + i.val + 1))
      (T 30 (414 + i.val)) (T 31 (414 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0470.entries OriginalRow227TriangleForward0470.checked
    ⟨i.val, by rw [size0470]; exact i.isLt⟩
  change (entry0470 i).check = true at h
  rcases fields0470 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0471 : OriginalRow227TriangleForward0471.entries.size = 25 := rfl

def entry0471 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0471.entries[i.val]'(by rw [size0471]; exact i.isLt)

theorem fields0471 (i : Fin 25) :
    (entry0471 i).IA = shift ∧ (entry0471 i).ID = S (446 + i.val + 1) ∧
      (entry0471 i).IC = S 31 ∧ (entry0471 i).Inext = T 30 (446 + i.val + 1) ∧
      (entry0471 i).Icur = T 30 (446 + i.val) ∧
      (entry0471 i).output = T 31 (446 + i.val) ∧
      (entry0471 i).charge = charge 30 (446 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow030.block0473_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨24, by decide⟩).symm, rfl⟩

theorem step0471 (i : Fin 25) :
    forwardStepOK (-768) (charge 30 (446 + i.val)) shift
      (S (446 + i.val + 1)) (S 31) (T 30 (446 + i.val + 1))
      (T 30 (446 + i.val)) (T 31 (446 + i.val))
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0471.entries OriginalRow227TriangleForward0471.checked
    ⟨i.val, by rw [size0471]; exact i.isLt⟩
  change (entry0471 i).check = true at h
  rcases fields0471 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 30 ≤ d) (hhi : d < 471) :
    forwardStepOK (-768) (charge 30 d) shift (S (d + 1)) (S 31)
      (T 30 (d + 1)) (T 30 d) (T 31 d)
      (OriginalRow227Roots.root_pos 31 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 30 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h126 : d < 126
    ·
      by_cases h62 : d < 62
      ·
        have hi : d - 30 < 32 := by omega
        have heq : 30 + (d - 30) = d := by omega
        simpa only [heq] using step0458 ⟨d - 30, hi⟩
      ·
        by_cases h94 : d < 94
        ·
          have hi : d - 62 < 32 := by omega
          have heq : 62 + (d - 62) = d := by omega
          simpa only [heq] using step0459 ⟨d - 62, hi⟩
        ·
          have hi : d - 94 < 32 := by omega
          have heq : 94 + (d - 94) = d := by omega
          simpa only [heq] using step0460 ⟨d - 94, hi⟩
    ·
      by_cases h190 : d < 190
      ·
        by_cases h158 : d < 158
        ·
          have hi : d - 126 < 32 := by omega
          have heq : 126 + (d - 126) = d := by omega
          simpa only [heq] using step0461 ⟨d - 126, hi⟩
        ·
          have hi : d - 158 < 32 := by omega
          have heq : 158 + (d - 158) = d := by omega
          simpa only [heq] using step0462 ⟨d - 158, hi⟩
      ·
        by_cases h222 : d < 222
        ·
          have hi : d - 190 < 32 := by omega
          have heq : 190 + (d - 190) = d := by omega
          simpa only [heq] using step0463 ⟨d - 190, hi⟩
        ·
          have hi : d - 222 < 32 := by omega
          have heq : 222 + (d - 222) = d := by omega
          simpa only [heq] using step0464 ⟨d - 222, hi⟩
  ·
    by_cases h350 : d < 350
    ·
      by_cases h286 : d < 286
      ·
        have hi : d - 254 < 32 := by omega
        have heq : 254 + (d - 254) = d := by omega
        simpa only [heq] using step0465 ⟨d - 254, hi⟩
      ·
        by_cases h318 : d < 318
        ·
          have hi : d - 286 < 32 := by omega
          have heq : 286 + (d - 286) = d := by omega
          simpa only [heq] using step0466 ⟨d - 286, hi⟩
        ·
          have hi : d - 318 < 32 := by omega
          have heq : 318 + (d - 318) = d := by omega
          simpa only [heq] using step0467 ⟨d - 318, hi⟩
    ·
      by_cases h414 : d < 414
      ·
        by_cases h382 : d < 382
        ·
          have hi : d - 350 < 32 := by omega
          have heq : 350 + (d - 350) = d := by omega
          simpa only [heq] using step0468 ⟨d - 350, hi⟩
        ·
          have hi : d - 382 < 32 := by omega
          have heq : 382 + (d - 382) = d := by omega
          simpa only [heq] using step0469 ⟨d - 382, hi⟩
      ·
        by_cases h446 : d < 446
        ·
          have hi : d - 414 < 32 := by omega
          have heq : 414 + (d - 414) = d := by omega
          simpa only [heq] using step0470 ⟨d - 414, hi⟩
        ·
          have hi : d - 446 < 25 := by omega
          have heq : 446 + (d - 446) = d := by omega
          simpa only [heq] using step0471 ⟨d - 446, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0458,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0458,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0459,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0459,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0460,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0460,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0461,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0461,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0462,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0462,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0463,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0463,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0464,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0464,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0465,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0465,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0466,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0466,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0467,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0467,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0468,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0468,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0469,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0469,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0470,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0470,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.fields0471,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.step0471,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow031
