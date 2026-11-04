import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow225
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226
import Grothe.UpperChaos.OriginalRow227TriangleForward2060
import Grothe.UpperChaos.OriginalRow227TriangleForward2061

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2060 : OriginalRow227TriangleForward2060.entries.size = 32 := rfl

def entry2060 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2060.entries[i.val]'(by rw [size2060]; exact i.isLt)

theorem fields2060 (i : Fin 32) :
    (entry2060 i).IA = shift ∧ (entry2060 i).ID = S (225 + i.val + 1) ∧
      (entry2060 i).IC = S 226 ∧ (entry2060 i).Inext = T 225 (225 + i.val + 1) ∧
      (entry2060 i).Icur = T 225 (225 + i.val) ∧
      (entry2060 i).output = T 226 (225 + i.val) ∧
      (entry2060 i).charge = charge 225 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2060 (i : Fin 32) :
    forwardStepOK (-768) (charge 225 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 226) (T 225 (225 + i.val + 1))
      (T 225 (225 + i.val)) (T 226 (225 + i.val))
      (OriginalRow227Roots.root_pos 226 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 225 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2060.entries OriginalRow227TriangleForward2060.checked
    ⟨i.val, by rw [size2060]; exact i.isLt⟩
  change (entry2060 i).check = true at h
  rcases fields2060 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2061 : OriginalRow227TriangleForward2061.entries.size = 19 := rfl

def entry2061 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2061.entries[i.val]'(by rw [size2061]; exact i.isLt)

theorem fields2061 (i : Fin 19) :
    (entry2061 i).IA = shift ∧ (entry2061 i).ID = S (257 + i.val + 1) ∧
      (entry2061 i).IC = S 226 ∧ (entry2061 i).Inext = T 225 (257 + i.val + 1) ∧
      (entry2061 i).Icur = T 225 (257 + i.val) ∧
      (entry2061 i).output = T 226 (257 + i.val) ∧
      (entry2061 i).charge = charge 225 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow225.block2075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨18, by decide⟩).symm, rfl⟩

theorem step2061 (i : Fin 19) :
    forwardStepOK (-768) (charge 225 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 226) (T 225 (257 + i.val + 1))
      (T 225 (257 + i.val)) (T 226 (257 + i.val))
      (OriginalRow227Roots.root_pos 226 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 225 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2061.entries OriginalRow227TriangleForward2061.checked
    ⟨i.val, by rw [size2061]; exact i.isLt⟩
  change (entry2061 i).check = true at h
  rcases fields2061 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 225 ≤ d) (hhi : d < 276) :
    forwardStepOK (-768) (charge 225 d) shift (S (d + 1)) (S 226)
      (T 225 (d + 1)) (T 225 d) (T 226 d)
      (OriginalRow227Roots.root_pos 226 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 225 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    have hi : d - 225 < 32 := by omega
    have heq : 225 + (d - 225) = d := by omega
    simpa only [heq] using step2060 ⟨d - 225, hi⟩
  ·
    have hi : d - 257 < 19 := by omega
    have heq : 257 + (d - 257) = d := by omega
    simpa only [heq] using step2061 ⟨d - 257, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226.fields2060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226.step2060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226.fields2061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226.step2061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow226
