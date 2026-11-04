import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228
import Grothe.UpperChaos.OriginalRow227TriangleForward2064
import Grothe.UpperChaos.OriginalRow227TriangleForward2065

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2064 : OriginalRow227TriangleForward2064.entries.size = 32 := rfl

def entry2064 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2064.entries[i.val]'(by rw [size2064]; exact i.isLt)

theorem fields2064 (i : Fin 32) :
    (entry2064 i).IA = shift ∧ (entry2064 i).ID = S (227 + i.val + 1) ∧
      (entry2064 i).IC = S 228 ∧ (entry2064 i).Inext = T 227 (227 + i.val + 1) ∧
      (entry2064 i).Icur = T 227 (227 + i.val) ∧
      (entry2064 i).output = T 228 (227 + i.val) ∧
      (entry2064 i).charge = charge 227 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2064 (i : Fin 32) :
    forwardStepOK (-768) (charge 227 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 228) (T 227 (227 + i.val + 1))
      (T 227 (227 + i.val)) (T 228 (227 + i.val))
      (OriginalRow227Roots.root_pos 228 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 227 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2064.entries OriginalRow227TriangleForward2064.checked
    ⟨i.val, by rw [size2064]; exact i.isLt⟩
  change (entry2064 i).check = true at h
  rcases fields2064 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2065 : OriginalRow227TriangleForward2065.entries.size = 15 := rfl

def entry2065 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2065.entries[i.val]'(by rw [size2065]; exact i.isLt)

theorem fields2065 (i : Fin 15) :
    (entry2065 i).IA = shift ∧ (entry2065 i).ID = S (259 + i.val + 1) ∧
      (entry2065 i).IC = S 228 ∧ (entry2065 i).Inext = T 227 (259 + i.val + 1) ∧
      (entry2065 i).Icur = T 227 (259 + i.val) ∧
      (entry2065 i).output = T 228 (259 + i.val) ∧
      (entry2065 i).charge = charge 227 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨14, by decide⟩).symm, rfl⟩

theorem step2065 (i : Fin 15) :
    forwardStepOK (-768) (charge 227 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 228) (T 227 (259 + i.val + 1))
      (T 227 (259 + i.val)) (T 228 (259 + i.val))
      (OriginalRow227Roots.root_pos 228 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 227 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2065.entries OriginalRow227TriangleForward2065.checked
    ⟨i.val, by rw [size2065]; exact i.isLt⟩
  change (entry2065 i).check = true at h
  rcases fields2065 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 227 ≤ d) (hhi : d < 274) :
    forwardStepOK (-768) (charge 227 d) shift (S (d + 1)) (S 228)
      (T 227 (d + 1)) (T 227 d) (T 228 d)
      (OriginalRow227Roots.root_pos 228 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 227 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    have hi : d - 227 < 32 := by omega
    have heq : 227 + (d - 227) = d := by omega
    simpa only [heq] using step2064 ⟨d - 227, hi⟩
  ·
    have hi : d - 259 < 15 := by omega
    have heq : 259 + (d - 259) = d := by omega
    simpa only [heq] using step2065 ⟨d - 259, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228.fields2064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228.step2064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228.fields2065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228.step2065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow228
