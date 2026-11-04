import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037
import Grothe.UpperChaos.OriginalRow227TriangleForward0542
import Grothe.UpperChaos.OriginalRow227TriangleForward0543
import Grothe.UpperChaos.OriginalRow227TriangleForward0544
import Grothe.UpperChaos.OriginalRow227TriangleForward0545
import Grothe.UpperChaos.OriginalRow227TriangleForward0546
import Grothe.UpperChaos.OriginalRow227TriangleForward0547
import Grothe.UpperChaos.OriginalRow227TriangleForward0548
import Grothe.UpperChaos.OriginalRow227TriangleForward0549
import Grothe.UpperChaos.OriginalRow227TriangleForward0550
import Grothe.UpperChaos.OriginalRow227TriangleForward0551
import Grothe.UpperChaos.OriginalRow227TriangleForward0552
import Grothe.UpperChaos.OriginalRow227TriangleForward0553
import Grothe.UpperChaos.OriginalRow227TriangleForward0554
import Grothe.UpperChaos.OriginalRow227TriangleForward0555

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0542 : OriginalRow227TriangleForward0542.entries.size = 32 := rfl

def entry0542 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0542.entries[i.val]'(by rw [size0542]; exact i.isLt)

theorem fields0542 (i : Fin 32) :
    (entry0542 i).IA = shift ∧ (entry0542 i).ID = S (36 + i.val + 1) ∧
      (entry0542 i).IC = S 37 ∧ (entry0542 i).Inext = T 36 (36 + i.val + 1) ∧
      (entry0542 i).Icur = T 36 (36 + i.val) ∧
      (entry0542 i).output = T 37 (36 + i.val) ∧
      (entry0542 i).charge = charge 36 (36 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0542 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (36 + i.val)) shift
      (S (36 + i.val + 1)) (S 37) (T 36 (36 + i.val + 1))
      (T 36 (36 + i.val)) (T 37 (36 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0542.entries OriginalRow227TriangleForward0542.checked
    ⟨i.val, by rw [size0542]; exact i.isLt⟩
  change (entry0542 i).check = true at h
  rcases fields0542 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0543 : OriginalRow227TriangleForward0543.entries.size = 32 := rfl

def entry0543 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0543.entries[i.val]'(by rw [size0543]; exact i.isLt)

theorem fields0543 (i : Fin 32) :
    (entry0543 i).IA = shift ∧ (entry0543 i).ID = S (68 + i.val + 1) ∧
      (entry0543 i).IC = S 37 ∧ (entry0543 i).Inext = T 36 (68 + i.val + 1) ∧
      (entry0543 i).Icur = T 36 (68 + i.val) ∧
      (entry0543 i).output = T 37 (68 + i.val) ∧
      (entry0543 i).charge = charge 36 (68 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0543 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (68 + i.val)) shift
      (S (68 + i.val + 1)) (S 37) (T 36 (68 + i.val + 1))
      (T 36 (68 + i.val)) (T 37 (68 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0543.entries OriginalRow227TriangleForward0543.checked
    ⟨i.val, by rw [size0543]; exact i.isLt⟩
  change (entry0543 i).check = true at h
  rcases fields0543 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0544 : OriginalRow227TriangleForward0544.entries.size = 32 := rfl

def entry0544 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0544.entries[i.val]'(by rw [size0544]; exact i.isLt)

theorem fields0544 (i : Fin 32) :
    (entry0544 i).IA = shift ∧ (entry0544 i).ID = S (100 + i.val + 1) ∧
      (entry0544 i).IC = S 37 ∧ (entry0544 i).Inext = T 36 (100 + i.val + 1) ∧
      (entry0544 i).Icur = T 36 (100 + i.val) ∧
      (entry0544 i).output = T 37 (100 + i.val) ∧
      (entry0544 i).charge = charge 36 (100 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0544 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (100 + i.val)) shift
      (S (100 + i.val + 1)) (S 37) (T 36 (100 + i.val + 1))
      (T 36 (100 + i.val)) (T 37 (100 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0544.entries OriginalRow227TriangleForward0544.checked
    ⟨i.val, by rw [size0544]; exact i.isLt⟩
  change (entry0544 i).check = true at h
  rcases fields0544 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0545 : OriginalRow227TriangleForward0545.entries.size = 32 := rfl

def entry0545 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0545.entries[i.val]'(by rw [size0545]; exact i.isLt)

theorem fields0545 (i : Fin 32) :
    (entry0545 i).IA = shift ∧ (entry0545 i).ID = S (132 + i.val + 1) ∧
      (entry0545 i).IC = S 37 ∧ (entry0545 i).Inext = T 36 (132 + i.val + 1) ∧
      (entry0545 i).Icur = T 36 (132 + i.val) ∧
      (entry0545 i).output = T 37 (132 + i.val) ∧
      (entry0545 i).charge = charge 36 (132 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0545 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (132 + i.val)) shift
      (S (132 + i.val + 1)) (S 37) (T 36 (132 + i.val + 1))
      (T 36 (132 + i.val)) (T 37 (132 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0545.entries OriginalRow227TriangleForward0545.checked
    ⟨i.val, by rw [size0545]; exact i.isLt⟩
  change (entry0545 i).check = true at h
  rcases fields0545 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0546 : OriginalRow227TriangleForward0546.entries.size = 32 := rfl

def entry0546 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0546.entries[i.val]'(by rw [size0546]; exact i.isLt)

theorem fields0546 (i : Fin 32) :
    (entry0546 i).IA = shift ∧ (entry0546 i).ID = S (164 + i.val + 1) ∧
      (entry0546 i).IC = S 37 ∧ (entry0546 i).Inext = T 36 (164 + i.val + 1) ∧
      (entry0546 i).Icur = T 36 (164 + i.val) ∧
      (entry0546 i).output = T 37 (164 + i.val) ∧
      (entry0546 i).charge = charge 36 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0546 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 37) (T 36 (164 + i.val + 1))
      (T 36 (164 + i.val)) (T 37 (164 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0546.entries OriginalRow227TriangleForward0546.checked
    ⟨i.val, by rw [size0546]; exact i.isLt⟩
  change (entry0546 i).check = true at h
  rcases fields0546 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0547 : OriginalRow227TriangleForward0547.entries.size = 32 := rfl

def entry0547 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0547.entries[i.val]'(by rw [size0547]; exact i.isLt)

theorem fields0547 (i : Fin 32) :
    (entry0547 i).IA = shift ∧ (entry0547 i).ID = S (196 + i.val + 1) ∧
      (entry0547 i).IC = S 37 ∧ (entry0547 i).Inext = T 36 (196 + i.val + 1) ∧
      (entry0547 i).Icur = T 36 (196 + i.val) ∧
      (entry0547 i).output = T 37 (196 + i.val) ∧
      (entry0547 i).charge = charge 36 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0547 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 37) (T 36 (196 + i.val + 1))
      (T 36 (196 + i.val)) (T 37 (196 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0547.entries OriginalRow227TriangleForward0547.checked
    ⟨i.val, by rw [size0547]; exact i.isLt⟩
  change (entry0547 i).check = true at h
  rcases fields0547 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0548 : OriginalRow227TriangleForward0548.entries.size = 32 := rfl

def entry0548 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0548.entries[i.val]'(by rw [size0548]; exact i.isLt)

theorem fields0548 (i : Fin 32) :
    (entry0548 i).IA = shift ∧ (entry0548 i).ID = S (228 + i.val + 1) ∧
      (entry0548 i).IC = S 37 ∧ (entry0548 i).Inext = T 36 (228 + i.val + 1) ∧
      (entry0548 i).Icur = T 36 (228 + i.val) ∧
      (entry0548 i).output = T 37 (228 + i.val) ∧
      (entry0548 i).charge = charge 36 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0548 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 37) (T 36 (228 + i.val + 1))
      (T 36 (228 + i.val)) (T 37 (228 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0548.entries OriginalRow227TriangleForward0548.checked
    ⟨i.val, by rw [size0548]; exact i.isLt⟩
  change (entry0548 i).check = true at h
  rcases fields0548 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0549 : OriginalRow227TriangleForward0549.entries.size = 32 := rfl

def entry0549 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0549.entries[i.val]'(by rw [size0549]; exact i.isLt)

theorem fields0549 (i : Fin 32) :
    (entry0549 i).IA = shift ∧ (entry0549 i).ID = S (260 + i.val + 1) ∧
      (entry0549 i).IC = S 37 ∧ (entry0549 i).Inext = T 36 (260 + i.val + 1) ∧
      (entry0549 i).Icur = T 36 (260 + i.val) ∧
      (entry0549 i).output = T 37 (260 + i.val) ∧
      (entry0549 i).charge = charge 36 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0549 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 37) (T 36 (260 + i.val + 1))
      (T 36 (260 + i.val)) (T 37 (260 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0549.entries OriginalRow227TriangleForward0549.checked
    ⟨i.val, by rw [size0549]; exact i.isLt⟩
  change (entry0549 i).check = true at h
  rcases fields0549 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0550 : OriginalRow227TriangleForward0550.entries.size = 32 := rfl

def entry0550 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0550.entries[i.val]'(by rw [size0550]; exact i.isLt)

theorem fields0550 (i : Fin 32) :
    (entry0550 i).IA = shift ∧ (entry0550 i).ID = S (292 + i.val + 1) ∧
      (entry0550 i).IC = S 37 ∧ (entry0550 i).Inext = T 36 (292 + i.val + 1) ∧
      (entry0550 i).Icur = T 36 (292 + i.val) ∧
      (entry0550 i).output = T 37 (292 + i.val) ∧
      (entry0550 i).charge = charge 36 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0550 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 37) (T 36 (292 + i.val + 1))
      (T 36 (292 + i.val)) (T 37 (292 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0550.entries OriginalRow227TriangleForward0550.checked
    ⟨i.val, by rw [size0550]; exact i.isLt⟩
  change (entry0550 i).check = true at h
  rcases fields0550 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0551 : OriginalRow227TriangleForward0551.entries.size = 32 := rfl

def entry0551 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0551.entries[i.val]'(by rw [size0551]; exact i.isLt)

theorem fields0551 (i : Fin 32) :
    (entry0551 i).IA = shift ∧ (entry0551 i).ID = S (324 + i.val + 1) ∧
      (entry0551 i).IC = S 37 ∧ (entry0551 i).Inext = T 36 (324 + i.val + 1) ∧
      (entry0551 i).Icur = T 36 (324 + i.val) ∧
      (entry0551 i).output = T 37 (324 + i.val) ∧
      (entry0551 i).charge = charge 36 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0551 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 37) (T 36 (324 + i.val + 1))
      (T 36 (324 + i.val)) (T 37 (324 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0551.entries OriginalRow227TriangleForward0551.checked
    ⟨i.val, by rw [size0551]; exact i.isLt⟩
  change (entry0551 i).check = true at h
  rcases fields0551 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0552 : OriginalRow227TriangleForward0552.entries.size = 32 := rfl

def entry0552 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0552.entries[i.val]'(by rw [size0552]; exact i.isLt)

theorem fields0552 (i : Fin 32) :
    (entry0552 i).IA = shift ∧ (entry0552 i).ID = S (356 + i.val + 1) ∧
      (entry0552 i).IC = S 37 ∧ (entry0552 i).Inext = T 36 (356 + i.val + 1) ∧
      (entry0552 i).Icur = T 36 (356 + i.val) ∧
      (entry0552 i).output = T 37 (356 + i.val) ∧
      (entry0552 i).charge = charge 36 (356 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0552 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (356 + i.val)) shift
      (S (356 + i.val + 1)) (S 37) (T 36 (356 + i.val + 1))
      (T 36 (356 + i.val)) (T 37 (356 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0552.entries OriginalRow227TriangleForward0552.checked
    ⟨i.val, by rw [size0552]; exact i.isLt⟩
  change (entry0552 i).check = true at h
  rcases fields0552 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0553 : OriginalRow227TriangleForward0553.entries.size = 32 := rfl

def entry0553 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0553.entries[i.val]'(by rw [size0553]; exact i.isLt)

theorem fields0553 (i : Fin 32) :
    (entry0553 i).IA = shift ∧ (entry0553 i).ID = S (388 + i.val + 1) ∧
      (entry0553 i).IC = S 37 ∧ (entry0553 i).Inext = T 36 (388 + i.val + 1) ∧
      (entry0553 i).Icur = T 36 (388 + i.val) ∧
      (entry0553 i).output = T 37 (388 + i.val) ∧
      (entry0553 i).charge = charge 36 (388 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0553 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (388 + i.val)) shift
      (S (388 + i.val + 1)) (S 37) (T 36 (388 + i.val + 1))
      (T 36 (388 + i.val)) (T 37 (388 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0553.entries OriginalRow227TriangleForward0553.checked
    ⟨i.val, by rw [size0553]; exact i.isLt⟩
  change (entry0553 i).check = true at h
  rcases fields0553 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0554 : OriginalRow227TriangleForward0554.entries.size = 32 := rfl

def entry0554 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0554.entries[i.val]'(by rw [size0554]; exact i.isLt)

theorem fields0554 (i : Fin 32) :
    (entry0554 i).IA = shift ∧ (entry0554 i).ID = S (420 + i.val + 1) ∧
      (entry0554 i).IC = S 37 ∧ (entry0554 i).Inext = T 36 (420 + i.val + 1) ∧
      (entry0554 i).Icur = T 36 (420 + i.val) ∧
      (entry0554 i).output = T 37 (420 + i.val) ∧
      (entry0554 i).charge = charge 36 (420 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0554 (i : Fin 32) :
    forwardStepOK (-768) (charge 36 (420 + i.val)) shift
      (S (420 + i.val + 1)) (S 37) (T 36 (420 + i.val + 1))
      (T 36 (420 + i.val)) (T 37 (420 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0554.entries OriginalRow227TriangleForward0554.checked
    ⟨i.val, by rw [size0554]; exact i.isLt⟩
  change (entry0554 i).check = true at h
  rcases fields0554 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0555 : OriginalRow227TriangleForward0555.entries.size = 13 := rfl

def entry0555 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0555.entries[i.val]'(by rw [size0555]; exact i.isLt)

theorem fields0555 (i : Fin 13) :
    (entry0555 i).IA = shift ∧ (entry0555 i).ID = S (452 + i.val + 1) ∧
      (entry0555 i).IC = S 37 ∧ (entry0555 i).Inext = T 36 (452 + i.val + 1) ∧
      (entry0555 i).Icur = T 36 (452 + i.val) ∧
      (entry0555 i).output = T 37 (452 + i.val) ∧
      (entry0555 i).charge = charge 36 (452 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨12, by decide⟩).symm, rfl⟩

theorem step0555 (i : Fin 13) :
    forwardStepOK (-768) (charge 36 (452 + i.val)) shift
      (S (452 + i.val + 1)) (S 37) (T 36 (452 + i.val + 1))
      (T 36 (452 + i.val)) (T 37 (452 + i.val))
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0555.entries OriginalRow227TriangleForward0555.checked
    ⟨i.val, by rw [size0555]; exact i.isLt⟩
  change (entry0555 i).check = true at h
  rcases fields0555 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 36 ≤ d) (hhi : d < 465) :
    forwardStepOK (-768) (charge 36 d) shift (S (d + 1)) (S 37)
      (T 36 (d + 1)) (T 36 d) (T 37 d)
      (OriginalRow227Roots.root_pos 37 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 36 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h132 : d < 132
    ·
      by_cases h68 : d < 68
      ·
        have hi : d - 36 < 32 := by omega
        have heq : 36 + (d - 36) = d := by omega
        simpa only [heq] using step0542 ⟨d - 36, hi⟩
      ·
        by_cases h100 : d < 100
        ·
          have hi : d - 68 < 32 := by omega
          have heq : 68 + (d - 68) = d := by omega
          simpa only [heq] using step0543 ⟨d - 68, hi⟩
        ·
          have hi : d - 100 < 32 := by omega
          have heq : 100 + (d - 100) = d := by omega
          simpa only [heq] using step0544 ⟨d - 100, hi⟩
    ·
      by_cases h196 : d < 196
      ·
        by_cases h164 : d < 164
        ·
          have hi : d - 132 < 32 := by omega
          have heq : 132 + (d - 132) = d := by omega
          simpa only [heq] using step0545 ⟨d - 132, hi⟩
        ·
          have hi : d - 164 < 32 := by omega
          have heq : 164 + (d - 164) = d := by omega
          simpa only [heq] using step0546 ⟨d - 164, hi⟩
      ·
        by_cases h228 : d < 228
        ·
          have hi : d - 196 < 32 := by omega
          have heq : 196 + (d - 196) = d := by omega
          simpa only [heq] using step0547 ⟨d - 196, hi⟩
        ·
          have hi : d - 228 < 32 := by omega
          have heq : 228 + (d - 228) = d := by omega
          simpa only [heq] using step0548 ⟨d - 228, hi⟩
  ·
    by_cases h356 : d < 356
    ·
      by_cases h292 : d < 292
      ·
        have hi : d - 260 < 32 := by omega
        have heq : 260 + (d - 260) = d := by omega
        simpa only [heq] using step0549 ⟨d - 260, hi⟩
      ·
        by_cases h324 : d < 324
        ·
          have hi : d - 292 < 32 := by omega
          have heq : 292 + (d - 292) = d := by omega
          simpa only [heq] using step0550 ⟨d - 292, hi⟩
        ·
          have hi : d - 324 < 32 := by omega
          have heq : 324 + (d - 324) = d := by omega
          simpa only [heq] using step0551 ⟨d - 324, hi⟩
    ·
      by_cases h420 : d < 420
      ·
        by_cases h388 : d < 388
        ·
          have hi : d - 356 < 32 := by omega
          have heq : 356 + (d - 356) = d := by omega
          simpa only [heq] using step0552 ⟨d - 356, hi⟩
        ·
          have hi : d - 388 < 32 := by omega
          have heq : 388 + (d - 388) = d := by omega
          simpa only [heq] using step0553 ⟨d - 388, hi⟩
      ·
        by_cases h452 : d < 452
        ·
          have hi : d - 420 < 32 := by omega
          have heq : 420 + (d - 420) = d := by omega
          simpa only [heq] using step0554 ⟨d - 420, hi⟩
        ·
          have hi : d - 452 < 13 := by omega
          have heq : 452 + (d - 452) = d := by omega
          simpa only [heq] using step0555 ⟨d - 452, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0542,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0542,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0543,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0543,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0544,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0544,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0545,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0545,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0546,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0546,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0547,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0547,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0548,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0548,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0549,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0549,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0550,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0550,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0551,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0551,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0552,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0552,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0553,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0553,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0554,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0554,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.fields0555,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.step0555,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow037
