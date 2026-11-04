import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209
import Grothe.UpperChaos.OriginalRow227TriangleForward2015
import Grothe.UpperChaos.OriginalRow227TriangleForward2016
import Grothe.UpperChaos.OriginalRow227TriangleForward2017

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2015 : OriginalRow227TriangleForward2015.entries.size = 32 := rfl

def entry2015 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2015.entries[i.val]'(by rw [size2015]; exact i.isLt)

theorem fields2015 (i : Fin 32) :
    (entry2015 i).IA = shift ∧ (entry2015 i).ID = S (208 + i.val + 1) ∧
      (entry2015 i).IC = S 209 ∧ (entry2015 i).Inext = T 208 (208 + i.val + 1) ∧
      (entry2015 i).Icur = T 208 (208 + i.val) ∧
      (entry2015 i).output = T 209 (208 + i.val) ∧
      (entry2015 i).charge = charge 208 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2031_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2015 (i : Fin 32) :
    forwardStepOK (-768) (charge 208 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 209) (T 208 (208 + i.val + 1))
      (T 208 (208 + i.val)) (T 209 (208 + i.val))
      (OriginalRow227Roots.root_pos 209 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 208 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2015.entries OriginalRow227TriangleForward2015.checked
    ⟨i.val, by rw [size2015]; exact i.isLt⟩
  change (entry2015 i).check = true at h
  rcases fields2015 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2016 : OriginalRow227TriangleForward2016.entries.size = 32 := rfl

def entry2016 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2016.entries[i.val]'(by rw [size2016]; exact i.isLt)

theorem fields2016 (i : Fin 32) :
    (entry2016 i).IA = shift ∧ (entry2016 i).ID = S (240 + i.val + 1) ∧
      (entry2016 i).IC = S 209 ∧ (entry2016 i).Inext = T 208 (240 + i.val + 1) ∧
      (entry2016 i).Icur = T 208 (240 + i.val) ∧
      (entry2016 i).output = T 209 (240 + i.val) ∧
      (entry2016 i).charge = charge 208 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2032_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2016 (i : Fin 32) :
    forwardStepOK (-768) (charge 208 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 209) (T 208 (240 + i.val + 1))
      (T 208 (240 + i.val)) (T 209 (240 + i.val))
      (OriginalRow227Roots.root_pos 209 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 208 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2016.entries OriginalRow227TriangleForward2016.checked
    ⟨i.val, by rw [size2016]; exact i.isLt⟩
  change (entry2016 i).check = true at h
  rcases fields2016 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2017 : OriginalRow227TriangleForward2017.entries.size = 21 := rfl

def entry2017 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2017.entries[i.val]'(by rw [size2017]; exact i.isLt)

theorem fields2017 (i : Fin 21) :
    (entry2017 i).IA = shift ∧ (entry2017 i).ID = S (272 + i.val + 1) ∧
      (entry2017 i).IC = S 209 ∧ (entry2017 i).Inext = T 208 (272 + i.val + 1) ∧
      (entry2017 i).Icur = T 208 (272 + i.val) ∧
      (entry2017 i).output = T 209 (272 + i.val) ∧
      (entry2017 i).charge = charge 208 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow209.block2033_value ⟨20, by decide⟩).symm, rfl⟩

theorem step2017 (i : Fin 21) :
    forwardStepOK (-768) (charge 208 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 209) (T 208 (272 + i.val + 1))
      (T 208 (272 + i.val)) (T 209 (272 + i.val))
      (OriginalRow227Roots.root_pos 209 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 208 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2017.entries OriginalRow227TriangleForward2017.checked
    ⟨i.val, by rw [size2017]; exact i.isLt⟩
  change (entry2017 i).check = true at h
  rcases fields2017 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 208 ≤ d) (hhi : d < 293) :
    forwardStepOK (-768) (charge 208 d) shift (S (d + 1)) (S 209)
      (T 208 (d + 1)) (T 208 d) (T 209 d)
      (OriginalRow227Roots.root_pos 209 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 208 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    have hi : d - 208 < 32 := by omega
    have heq : 208 + (d - 208) = d := by omega
    simpa only [heq] using step2015 ⟨d - 208, hi⟩
  ·
    by_cases h272 : d < 272
    ·
      have hi : d - 240 < 32 := by omega
      have heq : 240 + (d - 240) = d := by omega
      simpa only [heq] using step2016 ⟨d - 240, hi⟩
    ·
      have hi : d - 272 < 21 := by omega
      have heq : 272 + (d - 272) = d := by omega
      simpa only [heq] using step2017 ⟨d - 272, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.fields2015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.step2015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.fields2016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.step2016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.fields2017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.step2017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow209
