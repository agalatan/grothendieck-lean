import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow224
import Grothe.UpperChaos.OriginalRow227TriangleForward2056
import Grothe.UpperChaos.OriginalRow227TriangleForward2057

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2056 : OriginalRow227TriangleForward2056.entries.size = 32 := rfl

def entry2056 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2056.entries[i.val]'(by rw [size2056]; exact i.isLt)

theorem fields2056 (i : Fin 32) :
    (entry2056 i).IA = shift ∧ (entry2056 i).ID = S (223 + i.val + 1) ∧
      (entry2056 i).IC = S 224 ∧ (entry2056 i).Inext = T 223 (223 + i.val + 1) ∧
      (entry2056 i).Icur = T 223 (223 + i.val) ∧
      (entry2056 i).output = T 224 (223 + i.val) ∧
      (entry2056 i).charge = charge 223 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2072_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2056 (i : Fin 32) :
    forwardStepOK (-768) (charge 223 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 224) (T 223 (223 + i.val + 1))
      (T 223 (223 + i.val)) (T 224 (223 + i.val))
      (OriginalRow227Roots.root_pos 224 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 223 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2056.entries OriginalRow227TriangleForward2056.checked
    ⟨i.val, by rw [size2056]; exact i.isLt⟩
  change (entry2056 i).check = true at h
  rcases fields2056 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2057 : OriginalRow227TriangleForward2057.entries.size = 23 := rfl

def entry2057 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2057.entries[i.val]'(by rw [size2057]; exact i.isLt)

theorem fields2057 (i : Fin 23) :
    (entry2057 i).IA = shift ∧ (entry2057 i).ID = S (255 + i.val + 1) ∧
      (entry2057 i).IC = S 224 ∧ (entry2057 i).Inext = T 223 (255 + i.val + 1) ∧
      (entry2057 i).Icur = T 223 (255 + i.val) ∧
      (entry2057 i).output = T 224 (255 + i.val) ∧
      (entry2057 i).charge = charge 223 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow224.block2073_value ⟨22, by decide⟩).symm, rfl⟩

theorem step2057 (i : Fin 23) :
    forwardStepOK (-768) (charge 223 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 224) (T 223 (255 + i.val + 1))
      (T 223 (255 + i.val)) (T 224 (255 + i.val))
      (OriginalRow227Roots.root_pos 224 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 223 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2057.entries OriginalRow227TriangleForward2057.checked
    ⟨i.val, by rw [size2057]; exact i.isLt⟩
  change (entry2057 i).check = true at h
  rcases fields2057 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 223 ≤ d) (hhi : d < 278) :
    forwardStepOK (-768) (charge 223 d) shift (S (d + 1)) (S 224)
      (T 223 (d + 1)) (T 223 d) (T 224 d)
      (OriginalRow227Roots.root_pos 224 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 223 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    have hi : d - 223 < 32 := by omega
    have heq : 223 + (d - 223) = d := by omega
    simpa only [heq] using step2056 ⟨d - 223, hi⟩
  ·
    have hi : d - 255 < 23 := by omega
    have heq : 255 + (d - 255) = d := by omega
    simpa only [heq] using step2057 ⟨d - 255, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224.fields2056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224.step2056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224.fields2057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224.step2057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow224
