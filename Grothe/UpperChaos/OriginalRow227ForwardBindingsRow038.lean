import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038
import Grothe.UpperChaos.OriginalRow227TriangleForward0556
import Grothe.UpperChaos.OriginalRow227TriangleForward0557
import Grothe.UpperChaos.OriginalRow227TriangleForward0558
import Grothe.UpperChaos.OriginalRow227TriangleForward0559
import Grothe.UpperChaos.OriginalRow227TriangleForward0560
import Grothe.UpperChaos.OriginalRow227TriangleForward0561
import Grothe.UpperChaos.OriginalRow227TriangleForward0562
import Grothe.UpperChaos.OriginalRow227TriangleForward0563
import Grothe.UpperChaos.OriginalRow227TriangleForward0564
import Grothe.UpperChaos.OriginalRow227TriangleForward0565
import Grothe.UpperChaos.OriginalRow227TriangleForward0566
import Grothe.UpperChaos.OriginalRow227TriangleForward0567
import Grothe.UpperChaos.OriginalRow227TriangleForward0568
import Grothe.UpperChaos.OriginalRow227TriangleForward0569

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0556 : OriginalRow227TriangleForward0556.entries.size = 32 := rfl

def entry0556 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0556.entries[i.val]'(by rw [size0556]; exact i.isLt)

theorem fields0556 (i : Fin 32) :
    (entry0556 i).IA = shift ∧ (entry0556 i).ID = S (37 + i.val + 1) ∧
      (entry0556 i).IC = S 38 ∧ (entry0556 i).Inext = T 37 (37 + i.val + 1) ∧
      (entry0556 i).Icur = T 37 (37 + i.val) ∧
      (entry0556 i).output = T 38 (37 + i.val) ∧
      (entry0556 i).charge = charge 37 (37 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0558_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0556 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (37 + i.val)) shift
      (S (37 + i.val + 1)) (S 38) (T 37 (37 + i.val + 1))
      (T 37 (37 + i.val)) (T 38 (37 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0556.entries OriginalRow227TriangleForward0556.checked
    ⟨i.val, by rw [size0556]; exact i.isLt⟩
  change (entry0556 i).check = true at h
  rcases fields0556 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0557 : OriginalRow227TriangleForward0557.entries.size = 32 := rfl

def entry0557 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0557.entries[i.val]'(by rw [size0557]; exact i.isLt)

theorem fields0557 (i : Fin 32) :
    (entry0557 i).IA = shift ∧ (entry0557 i).ID = S (69 + i.val + 1) ∧
      (entry0557 i).IC = S 38 ∧ (entry0557 i).Inext = T 37 (69 + i.val + 1) ∧
      (entry0557 i).Icur = T 37 (69 + i.val) ∧
      (entry0557 i).output = T 38 (69 + i.val) ∧
      (entry0557 i).charge = charge 37 (69 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0559_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0557 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (69 + i.val)) shift
      (S (69 + i.val + 1)) (S 38) (T 37 (69 + i.val + 1))
      (T 37 (69 + i.val)) (T 38 (69 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0557.entries OriginalRow227TriangleForward0557.checked
    ⟨i.val, by rw [size0557]; exact i.isLt⟩
  change (entry0557 i).check = true at h
  rcases fields0557 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0558 : OriginalRow227TriangleForward0558.entries.size = 32 := rfl

def entry0558 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0558.entries[i.val]'(by rw [size0558]; exact i.isLt)

theorem fields0558 (i : Fin 32) :
    (entry0558 i).IA = shift ∧ (entry0558 i).ID = S (101 + i.val + 1) ∧
      (entry0558 i).IC = S 38 ∧ (entry0558 i).Inext = T 37 (101 + i.val + 1) ∧
      (entry0558 i).Icur = T 37 (101 + i.val) ∧
      (entry0558 i).output = T 38 (101 + i.val) ∧
      (entry0558 i).charge = charge 37 (101 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0560_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0558 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (101 + i.val)) shift
      (S (101 + i.val + 1)) (S 38) (T 37 (101 + i.val + 1))
      (T 37 (101 + i.val)) (T 38 (101 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0558.entries OriginalRow227TriangleForward0558.checked
    ⟨i.val, by rw [size0558]; exact i.isLt⟩
  change (entry0558 i).check = true at h
  rcases fields0558 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0559 : OriginalRow227TriangleForward0559.entries.size = 32 := rfl

def entry0559 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0559.entries[i.val]'(by rw [size0559]; exact i.isLt)

theorem fields0559 (i : Fin 32) :
    (entry0559 i).IA = shift ∧ (entry0559 i).ID = S (133 + i.val + 1) ∧
      (entry0559 i).IC = S 38 ∧ (entry0559 i).Inext = T 37 (133 + i.val + 1) ∧
      (entry0559 i).Icur = T 37 (133 + i.val) ∧
      (entry0559 i).output = T 38 (133 + i.val) ∧
      (entry0559 i).charge = charge 37 (133 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0561_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0559 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (133 + i.val)) shift
      (S (133 + i.val + 1)) (S 38) (T 37 (133 + i.val + 1))
      (T 37 (133 + i.val)) (T 38 (133 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0559.entries OriginalRow227TriangleForward0559.checked
    ⟨i.val, by rw [size0559]; exact i.isLt⟩
  change (entry0559 i).check = true at h
  rcases fields0559 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0560 : OriginalRow227TriangleForward0560.entries.size = 32 := rfl

def entry0560 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0560.entries[i.val]'(by rw [size0560]; exact i.isLt)

theorem fields0560 (i : Fin 32) :
    (entry0560 i).IA = shift ∧ (entry0560 i).ID = S (165 + i.val + 1) ∧
      (entry0560 i).IC = S 38 ∧ (entry0560 i).Inext = T 37 (165 + i.val + 1) ∧
      (entry0560 i).Icur = T 37 (165 + i.val) ∧
      (entry0560 i).output = T 38 (165 + i.val) ∧
      (entry0560 i).charge = charge 37 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0562_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0560 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 38) (T 37 (165 + i.val + 1))
      (T 37 (165 + i.val)) (T 38 (165 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0560.entries OriginalRow227TriangleForward0560.checked
    ⟨i.val, by rw [size0560]; exact i.isLt⟩
  change (entry0560 i).check = true at h
  rcases fields0560 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0561 : OriginalRow227TriangleForward0561.entries.size = 32 := rfl

def entry0561 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0561.entries[i.val]'(by rw [size0561]; exact i.isLt)

theorem fields0561 (i : Fin 32) :
    (entry0561 i).IA = shift ∧ (entry0561 i).ID = S (197 + i.val + 1) ∧
      (entry0561 i).IC = S 38 ∧ (entry0561 i).Inext = T 37 (197 + i.val + 1) ∧
      (entry0561 i).Icur = T 37 (197 + i.val) ∧
      (entry0561 i).output = T 38 (197 + i.val) ∧
      (entry0561 i).charge = charge 37 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0563_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0561 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 38) (T 37 (197 + i.val + 1))
      (T 37 (197 + i.val)) (T 38 (197 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0561.entries OriginalRow227TriangleForward0561.checked
    ⟨i.val, by rw [size0561]; exact i.isLt⟩
  change (entry0561 i).check = true at h
  rcases fields0561 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0562 : OriginalRow227TriangleForward0562.entries.size = 32 := rfl

def entry0562 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0562.entries[i.val]'(by rw [size0562]; exact i.isLt)

theorem fields0562 (i : Fin 32) :
    (entry0562 i).IA = shift ∧ (entry0562 i).ID = S (229 + i.val + 1) ∧
      (entry0562 i).IC = S 38 ∧ (entry0562 i).Inext = T 37 (229 + i.val + 1) ∧
      (entry0562 i).Icur = T 37 (229 + i.val) ∧
      (entry0562 i).output = T 38 (229 + i.val) ∧
      (entry0562 i).charge = charge 37 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0564_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0562 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 38) (T 37 (229 + i.val + 1))
      (T 37 (229 + i.val)) (T 38 (229 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0562.entries OriginalRow227TriangleForward0562.checked
    ⟨i.val, by rw [size0562]; exact i.isLt⟩
  change (entry0562 i).check = true at h
  rcases fields0562 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0563 : OriginalRow227TriangleForward0563.entries.size = 32 := rfl

def entry0563 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0563.entries[i.val]'(by rw [size0563]; exact i.isLt)

theorem fields0563 (i : Fin 32) :
    (entry0563 i).IA = shift ∧ (entry0563 i).ID = S (261 + i.val + 1) ∧
      (entry0563 i).IC = S 38 ∧ (entry0563 i).Inext = T 37 (261 + i.val + 1) ∧
      (entry0563 i).Icur = T 37 (261 + i.val) ∧
      (entry0563 i).output = T 38 (261 + i.val) ∧
      (entry0563 i).charge = charge 37 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0565_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0563 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 38) (T 37 (261 + i.val + 1))
      (T 37 (261 + i.val)) (T 38 (261 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0563.entries OriginalRow227TriangleForward0563.checked
    ⟨i.val, by rw [size0563]; exact i.isLt⟩
  change (entry0563 i).check = true at h
  rcases fields0563 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0564 : OriginalRow227TriangleForward0564.entries.size = 32 := rfl

def entry0564 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0564.entries[i.val]'(by rw [size0564]; exact i.isLt)

theorem fields0564 (i : Fin 32) :
    (entry0564 i).IA = shift ∧ (entry0564 i).ID = S (293 + i.val + 1) ∧
      (entry0564 i).IC = S 38 ∧ (entry0564 i).Inext = T 37 (293 + i.val + 1) ∧
      (entry0564 i).Icur = T 37 (293 + i.val) ∧
      (entry0564 i).output = T 38 (293 + i.val) ∧
      (entry0564 i).charge = charge 37 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0566_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0564 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 38) (T 37 (293 + i.val + 1))
      (T 37 (293 + i.val)) (T 38 (293 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0564.entries OriginalRow227TriangleForward0564.checked
    ⟨i.val, by rw [size0564]; exact i.isLt⟩
  change (entry0564 i).check = true at h
  rcases fields0564 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0565 : OriginalRow227TriangleForward0565.entries.size = 32 := rfl

def entry0565 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0565.entries[i.val]'(by rw [size0565]; exact i.isLt)

theorem fields0565 (i : Fin 32) :
    (entry0565 i).IA = shift ∧ (entry0565 i).ID = S (325 + i.val + 1) ∧
      (entry0565 i).IC = S 38 ∧ (entry0565 i).Inext = T 37 (325 + i.val + 1) ∧
      (entry0565 i).Icur = T 37 (325 + i.val) ∧
      (entry0565 i).output = T 38 (325 + i.val) ∧
      (entry0565 i).charge = charge 37 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0567_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0565 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 38) (T 37 (325 + i.val + 1))
      (T 37 (325 + i.val)) (T 38 (325 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0565.entries OriginalRow227TriangleForward0565.checked
    ⟨i.val, by rw [size0565]; exact i.isLt⟩
  change (entry0565 i).check = true at h
  rcases fields0565 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0566 : OriginalRow227TriangleForward0566.entries.size = 32 := rfl

def entry0566 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0566.entries[i.val]'(by rw [size0566]; exact i.isLt)

theorem fields0566 (i : Fin 32) :
    (entry0566 i).IA = shift ∧ (entry0566 i).ID = S (357 + i.val + 1) ∧
      (entry0566 i).IC = S 38 ∧ (entry0566 i).Inext = T 37 (357 + i.val + 1) ∧
      (entry0566 i).Icur = T 37 (357 + i.val) ∧
      (entry0566 i).output = T 38 (357 + i.val) ∧
      (entry0566 i).charge = charge 37 (357 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0568_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0566 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (357 + i.val)) shift
      (S (357 + i.val + 1)) (S 38) (T 37 (357 + i.val + 1))
      (T 37 (357 + i.val)) (T 38 (357 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0566.entries OriginalRow227TriangleForward0566.checked
    ⟨i.val, by rw [size0566]; exact i.isLt⟩
  change (entry0566 i).check = true at h
  rcases fields0566 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0567 : OriginalRow227TriangleForward0567.entries.size = 32 := rfl

def entry0567 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0567.entries[i.val]'(by rw [size0567]; exact i.isLt)

theorem fields0567 (i : Fin 32) :
    (entry0567 i).IA = shift ∧ (entry0567 i).ID = S (389 + i.val + 1) ∧
      (entry0567 i).IC = S 38 ∧ (entry0567 i).Inext = T 37 (389 + i.val + 1) ∧
      (entry0567 i).Icur = T 37 (389 + i.val) ∧
      (entry0567 i).output = T 38 (389 + i.val) ∧
      (entry0567 i).charge = charge 37 (389 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0569_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0567 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (389 + i.val)) shift
      (S (389 + i.val + 1)) (S 38) (T 37 (389 + i.val + 1))
      (T 37 (389 + i.val)) (T 38 (389 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0567.entries OriginalRow227TriangleForward0567.checked
    ⟨i.val, by rw [size0567]; exact i.isLt⟩
  change (entry0567 i).check = true at h
  rcases fields0567 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0568 : OriginalRow227TriangleForward0568.entries.size = 32 := rfl

def entry0568 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0568.entries[i.val]'(by rw [size0568]; exact i.isLt)

theorem fields0568 (i : Fin 32) :
    (entry0568 i).IA = shift ∧ (entry0568 i).ID = S (421 + i.val + 1) ∧
      (entry0568 i).IC = S 38 ∧ (entry0568 i).Inext = T 37 (421 + i.val + 1) ∧
      (entry0568 i).Icur = T 37 (421 + i.val) ∧
      (entry0568 i).output = T 38 (421 + i.val) ∧
      (entry0568 i).charge = charge 37 (421 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0570_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0568 (i : Fin 32) :
    forwardStepOK (-768) (charge 37 (421 + i.val)) shift
      (S (421 + i.val + 1)) (S 38) (T 37 (421 + i.val + 1))
      (T 37 (421 + i.val)) (T 38 (421 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0568.entries OriginalRow227TriangleForward0568.checked
    ⟨i.val, by rw [size0568]; exact i.isLt⟩
  change (entry0568 i).check = true at h
  rcases fields0568 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0569 : OriginalRow227TriangleForward0569.entries.size = 11 := rfl

def entry0569 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0569.entries[i.val]'(by rw [size0569]; exact i.isLt)

theorem fields0569 (i : Fin 11) :
    (entry0569 i).IA = shift ∧ (entry0569 i).ID = S (453 + i.val + 1) ∧
      (entry0569 i).IC = S 38 ∧ (entry0569 i).Inext = T 37 (453 + i.val + 1) ∧
      (entry0569 i).Icur = T 37 (453 + i.val) ∧
      (entry0569 i).output = T 38 (453 + i.val) ∧
      (entry0569 i).charge = charge 37 (453 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow037.block0571_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨10, by decide⟩).symm, rfl⟩

theorem step0569 (i : Fin 11) :
    forwardStepOK (-768) (charge 37 (453 + i.val)) shift
      (S (453 + i.val + 1)) (S 38) (T 37 (453 + i.val + 1))
      (T 37 (453 + i.val)) (T 38 (453 + i.val))
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0569.entries OriginalRow227TriangleForward0569.checked
    ⟨i.val, by rw [size0569]; exact i.isLt⟩
  change (entry0569 i).check = true at h
  rcases fields0569 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 37 ≤ d) (hhi : d < 464) :
    forwardStepOK (-768) (charge 37 d) shift (S (d + 1)) (S 38)
      (T 37 (d + 1)) (T 37 d) (T 38 d)
      (OriginalRow227Roots.root_pos 38 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 37 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h133 : d < 133
    ·
      by_cases h69 : d < 69
      ·
        have hi : d - 37 < 32 := by omega
        have heq : 37 + (d - 37) = d := by omega
        simpa only [heq] using step0556 ⟨d - 37, hi⟩
      ·
        by_cases h101 : d < 101
        ·
          have hi : d - 69 < 32 := by omega
          have heq : 69 + (d - 69) = d := by omega
          simpa only [heq] using step0557 ⟨d - 69, hi⟩
        ·
          have hi : d - 101 < 32 := by omega
          have heq : 101 + (d - 101) = d := by omega
          simpa only [heq] using step0558 ⟨d - 101, hi⟩
    ·
      by_cases h197 : d < 197
      ·
        by_cases h165 : d < 165
        ·
          have hi : d - 133 < 32 := by omega
          have heq : 133 + (d - 133) = d := by omega
          simpa only [heq] using step0559 ⟨d - 133, hi⟩
        ·
          have hi : d - 165 < 32 := by omega
          have heq : 165 + (d - 165) = d := by omega
          simpa only [heq] using step0560 ⟨d - 165, hi⟩
      ·
        by_cases h229 : d < 229
        ·
          have hi : d - 197 < 32 := by omega
          have heq : 197 + (d - 197) = d := by omega
          simpa only [heq] using step0561 ⟨d - 197, hi⟩
        ·
          have hi : d - 229 < 32 := by omega
          have heq : 229 + (d - 229) = d := by omega
          simpa only [heq] using step0562 ⟨d - 229, hi⟩
  ·
    by_cases h357 : d < 357
    ·
      by_cases h293 : d < 293
      ·
        have hi : d - 261 < 32 := by omega
        have heq : 261 + (d - 261) = d := by omega
        simpa only [heq] using step0563 ⟨d - 261, hi⟩
      ·
        by_cases h325 : d < 325
        ·
          have hi : d - 293 < 32 := by omega
          have heq : 293 + (d - 293) = d := by omega
          simpa only [heq] using step0564 ⟨d - 293, hi⟩
        ·
          have hi : d - 325 < 32 := by omega
          have heq : 325 + (d - 325) = d := by omega
          simpa only [heq] using step0565 ⟨d - 325, hi⟩
    ·
      by_cases h421 : d < 421
      ·
        by_cases h389 : d < 389
        ·
          have hi : d - 357 < 32 := by omega
          have heq : 357 + (d - 357) = d := by omega
          simpa only [heq] using step0566 ⟨d - 357, hi⟩
        ·
          have hi : d - 389 < 32 := by omega
          have heq : 389 + (d - 389) = d := by omega
          simpa only [heq] using step0567 ⟨d - 389, hi⟩
      ·
        by_cases h453 : d < 453
        ·
          have hi : d - 421 < 32 := by omega
          have heq : 421 + (d - 421) = d := by omega
          simpa only [heq] using step0568 ⟨d - 421, hi⟩
        ·
          have hi : d - 453 < 11 := by omega
          have heq : 453 + (d - 453) = d := by omega
          simpa only [heq] using step0569 ⟨d - 453, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0556,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0556,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0557,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0557,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0558,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0558,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0559,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0559,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0560,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0560,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0561,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0561,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0562,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0562,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0563,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0563,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0564,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0564,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0565,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0565,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0566,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0566,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0567,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0567,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0568,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0568,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.fields0569,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.step0569,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow038
