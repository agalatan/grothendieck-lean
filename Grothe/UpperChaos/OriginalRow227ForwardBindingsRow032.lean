import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032
import Grothe.UpperChaos.OriginalRow227TriangleForward0472
import Grothe.UpperChaos.OriginalRow227TriangleForward0473
import Grothe.UpperChaos.OriginalRow227TriangleForward0474
import Grothe.UpperChaos.OriginalRow227TriangleForward0475
import Grothe.UpperChaos.OriginalRow227TriangleForward0476
import Grothe.UpperChaos.OriginalRow227TriangleForward0477
import Grothe.UpperChaos.OriginalRow227TriangleForward0478
import Grothe.UpperChaos.OriginalRow227TriangleForward0479
import Grothe.UpperChaos.OriginalRow227TriangleForward0480
import Grothe.UpperChaos.OriginalRow227TriangleForward0481
import Grothe.UpperChaos.OriginalRow227TriangleForward0482
import Grothe.UpperChaos.OriginalRow227TriangleForward0483
import Grothe.UpperChaos.OriginalRow227TriangleForward0484
import Grothe.UpperChaos.OriginalRow227TriangleForward0485

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0472 : OriginalRow227TriangleForward0472.entries.size = 32 := rfl

def entry0472 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0472.entries[i.val]'(by rw [size0472]; exact i.isLt)

theorem fields0472 (i : Fin 32) :
    (entry0472 i).IA = shift ∧ (entry0472 i).ID = S (31 + i.val + 1) ∧
      (entry0472 i).IC = S 32 ∧ (entry0472 i).Inext = T 31 (31 + i.val + 1) ∧
      (entry0472 i).Icur = T 31 (31 + i.val) ∧
      (entry0472 i).output = T 32 (31 + i.val) ∧
      (entry0472 i).charge = charge 31 (31 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0474_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0472 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (31 + i.val)) shift
      (S (31 + i.val + 1)) (S 32) (T 31 (31 + i.val + 1))
      (T 31 (31 + i.val)) (T 32 (31 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0472.entries OriginalRow227TriangleForward0472.checked
    ⟨i.val, by rw [size0472]; exact i.isLt⟩
  change (entry0472 i).check = true at h
  rcases fields0472 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0473 : OriginalRow227TriangleForward0473.entries.size = 32 := rfl

def entry0473 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0473.entries[i.val]'(by rw [size0473]; exact i.isLt)

theorem fields0473 (i : Fin 32) :
    (entry0473 i).IA = shift ∧ (entry0473 i).ID = S (63 + i.val + 1) ∧
      (entry0473 i).IC = S 32 ∧ (entry0473 i).Inext = T 31 (63 + i.val + 1) ∧
      (entry0473 i).Icur = T 31 (63 + i.val) ∧
      (entry0473 i).output = T 32 (63 + i.val) ∧
      (entry0473 i).charge = charge 31 (63 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0475_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0473 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (63 + i.val)) shift
      (S (63 + i.val + 1)) (S 32) (T 31 (63 + i.val + 1))
      (T 31 (63 + i.val)) (T 32 (63 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0473.entries OriginalRow227TriangleForward0473.checked
    ⟨i.val, by rw [size0473]; exact i.isLt⟩
  change (entry0473 i).check = true at h
  rcases fields0473 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0474 : OriginalRow227TriangleForward0474.entries.size = 32 := rfl

def entry0474 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0474.entries[i.val]'(by rw [size0474]; exact i.isLt)

theorem fields0474 (i : Fin 32) :
    (entry0474 i).IA = shift ∧ (entry0474 i).ID = S (95 + i.val + 1) ∧
      (entry0474 i).IC = S 32 ∧ (entry0474 i).Inext = T 31 (95 + i.val + 1) ∧
      (entry0474 i).Icur = T 31 (95 + i.val) ∧
      (entry0474 i).output = T 32 (95 + i.val) ∧
      (entry0474 i).charge = charge 31 (95 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0476_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0474 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (95 + i.val)) shift
      (S (95 + i.val + 1)) (S 32) (T 31 (95 + i.val + 1))
      (T 31 (95 + i.val)) (T 32 (95 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0474.entries OriginalRow227TriangleForward0474.checked
    ⟨i.val, by rw [size0474]; exact i.isLt⟩
  change (entry0474 i).check = true at h
  rcases fields0474 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0475 : OriginalRow227TriangleForward0475.entries.size = 32 := rfl

def entry0475 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0475.entries[i.val]'(by rw [size0475]; exact i.isLt)

theorem fields0475 (i : Fin 32) :
    (entry0475 i).IA = shift ∧ (entry0475 i).ID = S (127 + i.val + 1) ∧
      (entry0475 i).IC = S 32 ∧ (entry0475 i).Inext = T 31 (127 + i.val + 1) ∧
      (entry0475 i).Icur = T 31 (127 + i.val) ∧
      (entry0475 i).output = T 32 (127 + i.val) ∧
      (entry0475 i).charge = charge 31 (127 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0477_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0475 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (127 + i.val)) shift
      (S (127 + i.val + 1)) (S 32) (T 31 (127 + i.val + 1))
      (T 31 (127 + i.val)) (T 32 (127 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0475.entries OriginalRow227TriangleForward0475.checked
    ⟨i.val, by rw [size0475]; exact i.isLt⟩
  change (entry0475 i).check = true at h
  rcases fields0475 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0476 : OriginalRow227TriangleForward0476.entries.size = 32 := rfl

def entry0476 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0476.entries[i.val]'(by rw [size0476]; exact i.isLt)

theorem fields0476 (i : Fin 32) :
    (entry0476 i).IA = shift ∧ (entry0476 i).ID = S (159 + i.val + 1) ∧
      (entry0476 i).IC = S 32 ∧ (entry0476 i).Inext = T 31 (159 + i.val + 1) ∧
      (entry0476 i).Icur = T 31 (159 + i.val) ∧
      (entry0476 i).output = T 32 (159 + i.val) ∧
      (entry0476 i).charge = charge 31 (159 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0478_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0476 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (159 + i.val)) shift
      (S (159 + i.val + 1)) (S 32) (T 31 (159 + i.val + 1))
      (T 31 (159 + i.val)) (T 32 (159 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0476.entries OriginalRow227TriangleForward0476.checked
    ⟨i.val, by rw [size0476]; exact i.isLt⟩
  change (entry0476 i).check = true at h
  rcases fields0476 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0477 : OriginalRow227TriangleForward0477.entries.size = 32 := rfl

def entry0477 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0477.entries[i.val]'(by rw [size0477]; exact i.isLt)

theorem fields0477 (i : Fin 32) :
    (entry0477 i).IA = shift ∧ (entry0477 i).ID = S (191 + i.val + 1) ∧
      (entry0477 i).IC = S 32 ∧ (entry0477 i).Inext = T 31 (191 + i.val + 1) ∧
      (entry0477 i).Icur = T 31 (191 + i.val) ∧
      (entry0477 i).output = T 32 (191 + i.val) ∧
      (entry0477 i).charge = charge 31 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0479_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0477 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 32) (T 31 (191 + i.val + 1))
      (T 31 (191 + i.val)) (T 32 (191 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0477.entries OriginalRow227TriangleForward0477.checked
    ⟨i.val, by rw [size0477]; exact i.isLt⟩
  change (entry0477 i).check = true at h
  rcases fields0477 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0478 : OriginalRow227TriangleForward0478.entries.size = 32 := rfl

def entry0478 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0478.entries[i.val]'(by rw [size0478]; exact i.isLt)

theorem fields0478 (i : Fin 32) :
    (entry0478 i).IA = shift ∧ (entry0478 i).ID = S (223 + i.val + 1) ∧
      (entry0478 i).IC = S 32 ∧ (entry0478 i).Inext = T 31 (223 + i.val + 1) ∧
      (entry0478 i).Icur = T 31 (223 + i.val) ∧
      (entry0478 i).output = T 32 (223 + i.val) ∧
      (entry0478 i).charge = charge 31 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0480_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0478 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 32) (T 31 (223 + i.val + 1))
      (T 31 (223 + i.val)) (T 32 (223 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0478.entries OriginalRow227TriangleForward0478.checked
    ⟨i.val, by rw [size0478]; exact i.isLt⟩
  change (entry0478 i).check = true at h
  rcases fields0478 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0479 : OriginalRow227TriangleForward0479.entries.size = 32 := rfl

def entry0479 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0479.entries[i.val]'(by rw [size0479]; exact i.isLt)

theorem fields0479 (i : Fin 32) :
    (entry0479 i).IA = shift ∧ (entry0479 i).ID = S (255 + i.val + 1) ∧
      (entry0479 i).IC = S 32 ∧ (entry0479 i).Inext = T 31 (255 + i.val + 1) ∧
      (entry0479 i).Icur = T 31 (255 + i.val) ∧
      (entry0479 i).output = T 32 (255 + i.val) ∧
      (entry0479 i).charge = charge 31 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0481_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0479 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 32) (T 31 (255 + i.val + 1))
      (T 31 (255 + i.val)) (T 32 (255 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0479.entries OriginalRow227TriangleForward0479.checked
    ⟨i.val, by rw [size0479]; exact i.isLt⟩
  change (entry0479 i).check = true at h
  rcases fields0479 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0480 : OriginalRow227TriangleForward0480.entries.size = 32 := rfl

def entry0480 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0480.entries[i.val]'(by rw [size0480]; exact i.isLt)

theorem fields0480 (i : Fin 32) :
    (entry0480 i).IA = shift ∧ (entry0480 i).ID = S (287 + i.val + 1) ∧
      (entry0480 i).IC = S 32 ∧ (entry0480 i).Inext = T 31 (287 + i.val + 1) ∧
      (entry0480 i).Icur = T 31 (287 + i.val) ∧
      (entry0480 i).output = T 32 (287 + i.val) ∧
      (entry0480 i).charge = charge 31 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0482_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0480 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 32) (T 31 (287 + i.val + 1))
      (T 31 (287 + i.val)) (T 32 (287 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0480.entries OriginalRow227TriangleForward0480.checked
    ⟨i.val, by rw [size0480]; exact i.isLt⟩
  change (entry0480 i).check = true at h
  rcases fields0480 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0481 : OriginalRow227TriangleForward0481.entries.size = 32 := rfl

def entry0481 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0481.entries[i.val]'(by rw [size0481]; exact i.isLt)

theorem fields0481 (i : Fin 32) :
    (entry0481 i).IA = shift ∧ (entry0481 i).ID = S (319 + i.val + 1) ∧
      (entry0481 i).IC = S 32 ∧ (entry0481 i).Inext = T 31 (319 + i.val + 1) ∧
      (entry0481 i).Icur = T 31 (319 + i.val) ∧
      (entry0481 i).output = T 32 (319 + i.val) ∧
      (entry0481 i).charge = charge 31 (319 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0483_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0481 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (319 + i.val)) shift
      (S (319 + i.val + 1)) (S 32) (T 31 (319 + i.val + 1))
      (T 31 (319 + i.val)) (T 32 (319 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0481.entries OriginalRow227TriangleForward0481.checked
    ⟨i.val, by rw [size0481]; exact i.isLt⟩
  change (entry0481 i).check = true at h
  rcases fields0481 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0482 : OriginalRow227TriangleForward0482.entries.size = 32 := rfl

def entry0482 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0482.entries[i.val]'(by rw [size0482]; exact i.isLt)

theorem fields0482 (i : Fin 32) :
    (entry0482 i).IA = shift ∧ (entry0482 i).ID = S (351 + i.val + 1) ∧
      (entry0482 i).IC = S 32 ∧ (entry0482 i).Inext = T 31 (351 + i.val + 1) ∧
      (entry0482 i).Icur = T 31 (351 + i.val) ∧
      (entry0482 i).output = T 32 (351 + i.val) ∧
      (entry0482 i).charge = charge 31 (351 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0484_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0482 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (351 + i.val)) shift
      (S (351 + i.val + 1)) (S 32) (T 31 (351 + i.val + 1))
      (T 31 (351 + i.val)) (T 32 (351 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0482.entries OriginalRow227TriangleForward0482.checked
    ⟨i.val, by rw [size0482]; exact i.isLt⟩
  change (entry0482 i).check = true at h
  rcases fields0482 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0483 : OriginalRow227TriangleForward0483.entries.size = 32 := rfl

def entry0483 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0483.entries[i.val]'(by rw [size0483]; exact i.isLt)

theorem fields0483 (i : Fin 32) :
    (entry0483 i).IA = shift ∧ (entry0483 i).ID = S (383 + i.val + 1) ∧
      (entry0483 i).IC = S 32 ∧ (entry0483 i).Inext = T 31 (383 + i.val + 1) ∧
      (entry0483 i).Icur = T 31 (383 + i.val) ∧
      (entry0483 i).output = T 32 (383 + i.val) ∧
      (entry0483 i).charge = charge 31 (383 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0485_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0483 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (383 + i.val)) shift
      (S (383 + i.val + 1)) (S 32) (T 31 (383 + i.val + 1))
      (T 31 (383 + i.val)) (T 32 (383 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0483.entries OriginalRow227TriangleForward0483.checked
    ⟨i.val, by rw [size0483]; exact i.isLt⟩
  change (entry0483 i).check = true at h
  rcases fields0483 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0484 : OriginalRow227TriangleForward0484.entries.size = 32 := rfl

def entry0484 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0484.entries[i.val]'(by rw [size0484]; exact i.isLt)

theorem fields0484 (i : Fin 32) :
    (entry0484 i).IA = shift ∧ (entry0484 i).ID = S (415 + i.val + 1) ∧
      (entry0484 i).IC = S 32 ∧ (entry0484 i).Inext = T 31 (415 + i.val + 1) ∧
      (entry0484 i).Icur = T 31 (415 + i.val) ∧
      (entry0484 i).output = T 32 (415 + i.val) ∧
      (entry0484 i).charge = charge 31 (415 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0486_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0484 (i : Fin 32) :
    forwardStepOK (-768) (charge 31 (415 + i.val)) shift
      (S (415 + i.val + 1)) (S 32) (T 31 (415 + i.val + 1))
      (T 31 (415 + i.val)) (T 32 (415 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0484.entries OriginalRow227TriangleForward0484.checked
    ⟨i.val, by rw [size0484]; exact i.isLt⟩
  change (entry0484 i).check = true at h
  rcases fields0484 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0485 : OriginalRow227TriangleForward0485.entries.size = 23 := rfl

def entry0485 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0485.entries[i.val]'(by rw [size0485]; exact i.isLt)

theorem fields0485 (i : Fin 23) :
    (entry0485 i).IA = shift ∧ (entry0485 i).ID = S (447 + i.val + 1) ∧
      (entry0485 i).IC = S 32 ∧ (entry0485 i).Inext = T 31 (447 + i.val + 1) ∧
      (entry0485 i).Icur = T 31 (447 + i.val) ∧
      (entry0485 i).output = T 32 (447 + i.val) ∧
      (entry0485 i).charge = charge 31 (447 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow031.block0487_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨22, by decide⟩).symm, rfl⟩

theorem step0485 (i : Fin 23) :
    forwardStepOK (-768) (charge 31 (447 + i.val)) shift
      (S (447 + i.val + 1)) (S 32) (T 31 (447 + i.val + 1))
      (T 31 (447 + i.val)) (T 32 (447 + i.val))
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0485.entries OriginalRow227TriangleForward0485.checked
    ⟨i.val, by rw [size0485]; exact i.isLt⟩
  change (entry0485 i).check = true at h
  rcases fields0485 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 31 ≤ d) (hhi : d < 470) :
    forwardStepOK (-768) (charge 31 d) shift (S (d + 1)) (S 32)
      (T 31 (d + 1)) (T 31 d) (T 32 d)
      (OriginalRow227Roots.root_pos 32 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 31 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h127 : d < 127
    ·
      by_cases h63 : d < 63
      ·
        have hi : d - 31 < 32 := by omega
        have heq : 31 + (d - 31) = d := by omega
        simpa only [heq] using step0472 ⟨d - 31, hi⟩
      ·
        by_cases h95 : d < 95
        ·
          have hi : d - 63 < 32 := by omega
          have heq : 63 + (d - 63) = d := by omega
          simpa only [heq] using step0473 ⟨d - 63, hi⟩
        ·
          have hi : d - 95 < 32 := by omega
          have heq : 95 + (d - 95) = d := by omega
          simpa only [heq] using step0474 ⟨d - 95, hi⟩
    ·
      by_cases h191 : d < 191
      ·
        by_cases h159 : d < 159
        ·
          have hi : d - 127 < 32 := by omega
          have heq : 127 + (d - 127) = d := by omega
          simpa only [heq] using step0475 ⟨d - 127, hi⟩
        ·
          have hi : d - 159 < 32 := by omega
          have heq : 159 + (d - 159) = d := by omega
          simpa only [heq] using step0476 ⟨d - 159, hi⟩
      ·
        by_cases h223 : d < 223
        ·
          have hi : d - 191 < 32 := by omega
          have heq : 191 + (d - 191) = d := by omega
          simpa only [heq] using step0477 ⟨d - 191, hi⟩
        ·
          have hi : d - 223 < 32 := by omega
          have heq : 223 + (d - 223) = d := by omega
          simpa only [heq] using step0478 ⟨d - 223, hi⟩
  ·
    by_cases h351 : d < 351
    ·
      by_cases h287 : d < 287
      ·
        have hi : d - 255 < 32 := by omega
        have heq : 255 + (d - 255) = d := by omega
        simpa only [heq] using step0479 ⟨d - 255, hi⟩
      ·
        by_cases h319 : d < 319
        ·
          have hi : d - 287 < 32 := by omega
          have heq : 287 + (d - 287) = d := by omega
          simpa only [heq] using step0480 ⟨d - 287, hi⟩
        ·
          have hi : d - 319 < 32 := by omega
          have heq : 319 + (d - 319) = d := by omega
          simpa only [heq] using step0481 ⟨d - 319, hi⟩
    ·
      by_cases h415 : d < 415
      ·
        by_cases h383 : d < 383
        ·
          have hi : d - 351 < 32 := by omega
          have heq : 351 + (d - 351) = d := by omega
          simpa only [heq] using step0482 ⟨d - 351, hi⟩
        ·
          have hi : d - 383 < 32 := by omega
          have heq : 383 + (d - 383) = d := by omega
          simpa only [heq] using step0483 ⟨d - 383, hi⟩
      ·
        by_cases h447 : d < 447
        ·
          have hi : d - 415 < 32 := by omega
          have heq : 415 + (d - 415) = d := by omega
          simpa only [heq] using step0484 ⟨d - 415, hi⟩
        ·
          have hi : d - 447 < 23 := by omega
          have heq : 447 + (d - 447) = d := by omega
          simpa only [heq] using step0485 ⟨d - 447, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0472,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0472,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0473,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0473,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0474,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0474,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0475,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0475,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0476,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0476,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0477,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0477,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0478,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0478,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0479,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0479,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0480,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0480,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0481,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0481,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0482,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0482,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0483,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0483,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0484,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0484,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.fields0485,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.step0485,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow032
