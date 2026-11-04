import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow223
import Grothe.UpperChaos.OriginalRow227TriangleForward2054
import Grothe.UpperChaos.OriginalRow227TriangleForward2055

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2054 : OriginalRow227TriangleForward2054.entries.size = 32 := rfl

def entry2054 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2054.entries[i.val]'(by rw [size2054]; exact i.isLt)

theorem fields2054 (i : Fin 32) :
    (entry2054 i).IA = shift ∧ (entry2054 i).ID = S (222 + i.val + 1) ∧
      (entry2054 i).IC = S 223 ∧ (entry2054 i).Inext = T 222 (222 + i.val + 1) ∧
      (entry2054 i).Icur = T 222 (222 + i.val) ∧
      (entry2054 i).output = T 223 (222 + i.val) ∧
      (entry2054 i).charge = charge 222 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2070_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2054 (i : Fin 32) :
    forwardStepOK (-768) (charge 222 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 223) (T 222 (222 + i.val + 1))
      (T 222 (222 + i.val)) (T 223 (222 + i.val))
      (OriginalRow227Roots.root_pos 223 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 222 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2054.entries OriginalRow227TriangleForward2054.checked
    ⟨i.val, by rw [size2054]; exact i.isLt⟩
  change (entry2054 i).check = true at h
  rcases fields2054 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2055 : OriginalRow227TriangleForward2055.entries.size = 25 := rfl

def entry2055 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2055.entries[i.val]'(by rw [size2055]; exact i.isLt)

theorem fields2055 (i : Fin 25) :
    (entry2055 i).IA = shift ∧ (entry2055 i).ID = S (254 + i.val + 1) ∧
      (entry2055 i).IC = S 223 ∧ (entry2055 i).Inext = T 222 (254 + i.val + 1) ∧
      (entry2055 i).Icur = T 222 (254 + i.val) ∧
      (entry2055 i).output = T 223 (254 + i.val) ∧
      (entry2055 i).charge = charge 222 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow223.block2071_value ⟨24, by decide⟩).symm, rfl⟩

theorem step2055 (i : Fin 25) :
    forwardStepOK (-768) (charge 222 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 223) (T 222 (254 + i.val + 1))
      (T 222 (254 + i.val)) (T 223 (254 + i.val))
      (OriginalRow227Roots.root_pos 223 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 222 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2055.entries OriginalRow227TriangleForward2055.checked
    ⟨i.val, by rw [size2055]; exact i.isLt⟩
  change (entry2055 i).check = true at h
  rcases fields2055 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 222 ≤ d) (hhi : d < 279) :
    forwardStepOK (-768) (charge 222 d) shift (S (d + 1)) (S 223)
      (T 222 (d + 1)) (T 222 d) (T 223 d)
      (OriginalRow227Roots.root_pos 223 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 222 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    have hi : d - 222 < 32 := by omega
    have heq : 222 + (d - 222) = d := by omega
    simpa only [heq] using step2054 ⟨d - 222, hi⟩
  ·
    have hi : d - 254 < 25 := by omega
    have heq : 254 + (d - 254) = d := by omega
    simpa only [heq] using step2055 ⟨d - 254, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223.fields2054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223.step2054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223.fields2055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223.step2055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow223
