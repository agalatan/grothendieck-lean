import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225
import Grothe.UpperChaos.OriginalRow227TriangleForward2058
import Grothe.UpperChaos.OriginalRow227TriangleForward2059

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2058 : OriginalRow227TriangleForward2058.entries.size = 32 := rfl

def entry2058 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2058.entries[i.val]'(by rw [size2058]; exact i.isLt)

theorem fields2058 (i : Fin 32) :
    (entry2058 i).IA = shift ∧ (entry2058 i).ID = S (224 + i.val + 1) ∧
      (entry2058 i).IC = S 225 ∧ (entry2058 i).Inext = T 224 (224 + i.val + 1) ∧
      (entry2058 i).Icur = T 224 (224 + i.val) ∧
      (entry2058 i).output = T 225 (224 + i.val) ∧
      (entry2058 i).charge = charge 224 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2058 (i : Fin 32) :
    forwardStepOK (-768) (charge 224 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 225) (T 224 (224 + i.val + 1))
      (T 224 (224 + i.val)) (T 225 (224 + i.val))
      (OriginalRow227Roots.root_pos 225 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 224 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2058.entries OriginalRow227TriangleForward2058.checked
    ⟨i.val, by rw [size2058]; exact i.isLt⟩
  change (entry2058 i).check = true at h
  rcases fields2058 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2059 : OriginalRow227TriangleForward2059.entries.size = 21 := rfl

def entry2059 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2059.entries[i.val]'(by rw [size2059]; exact i.isLt)

theorem fields2059 (i : Fin 21) :
    (entry2059 i).IA = shift ∧ (entry2059 i).ID = S (256 + i.val + 1) ∧
      (entry2059 i).IC = S 225 ∧ (entry2059 i).Inext = T 224 (256 + i.val + 1) ∧
      (entry2059 i).Icur = T 224 (256 + i.val) ∧
      (entry2059 i).output = T 225 (256 + i.val) ∧
      (entry2059 i).charge = charge 224 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨20, by decide⟩).symm, rfl⟩

theorem step2059 (i : Fin 21) :
    forwardStepOK (-768) (charge 224 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 225) (T 224 (256 + i.val + 1))
      (T 224 (256 + i.val)) (T 225 (256 + i.val))
      (OriginalRow227Roots.root_pos 225 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 224 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2059.entries OriginalRow227TriangleForward2059.checked
    ⟨i.val, by rw [size2059]; exact i.isLt⟩
  change (entry2059 i).check = true at h
  rcases fields2059 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 224 ≤ d) (hhi : d < 277) :
    forwardStepOK (-768) (charge 224 d) shift (S (d + 1)) (S 225)
      (T 224 (d + 1)) (T 224 d) (T 225 d)
      (OriginalRow227Roots.root_pos 225 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 224 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    have hi : d - 224 < 32 := by omega
    have heq : 224 + (d - 224) = d := by omega
    simpa only [heq] using step2058 ⟨d - 224, hi⟩
  ·
    have hi : d - 256 < 21 := by omega
    have heq : 256 + (d - 256) = d := by omega
    simpa only [heq] using step2059 ⟨d - 256, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225.fields2058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225.step2058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225.fields2059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225.step2059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow225
