import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow208
import Grothe.UpperChaos.OriginalRow227TriangleForward2012
import Grothe.UpperChaos.OriginalRow227TriangleForward2013
import Grothe.UpperChaos.OriginalRow227TriangleForward2014

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2012 : OriginalRow227TriangleForward2012.entries.size = 32 := rfl

def entry2012 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2012.entries[i.val]'(by rw [size2012]; exact i.isLt)

theorem fields2012 (i : Fin 32) :
    (entry2012 i).IA = shift ∧ (entry2012 i).ID = S (207 + i.val + 1) ∧
      (entry2012 i).IC = S 208 ∧ (entry2012 i).Inext = T 207 (207 + i.val + 1) ∧
      (entry2012 i).Icur = T 207 (207 + i.val) ∧
      (entry2012 i).output = T 208 (207 + i.val) ∧
      (entry2012 i).charge = charge 207 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2028_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2012 (i : Fin 32) :
    forwardStepOK (-768) (charge 207 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 208) (T 207 (207 + i.val + 1))
      (T 207 (207 + i.val)) (T 208 (207 + i.val))
      (OriginalRow227Roots.root_pos 208 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 207 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2012.entries OriginalRow227TriangleForward2012.checked
    ⟨i.val, by rw [size2012]; exact i.isLt⟩
  change (entry2012 i).check = true at h
  rcases fields2012 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2013 : OriginalRow227TriangleForward2013.entries.size = 32 := rfl

def entry2013 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2013.entries[i.val]'(by rw [size2013]; exact i.isLt)

theorem fields2013 (i : Fin 32) :
    (entry2013 i).IA = shift ∧ (entry2013 i).ID = S (239 + i.val + 1) ∧
      (entry2013 i).IC = S 208 ∧ (entry2013 i).Inext = T 207 (239 + i.val + 1) ∧
      (entry2013 i).Icur = T 207 (239 + i.val) ∧
      (entry2013 i).output = T 208 (239 + i.val) ∧
      (entry2013 i).charge = charge 207 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2029_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2013 (i : Fin 32) :
    forwardStepOK (-768) (charge 207 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 208) (T 207 (239 + i.val + 1))
      (T 207 (239 + i.val)) (T 208 (239 + i.val))
      (OriginalRow227Roots.root_pos 208 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 207 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2013.entries OriginalRow227TriangleForward2013.checked
    ⟨i.val, by rw [size2013]; exact i.isLt⟩
  change (entry2013 i).check = true at h
  rcases fields2013 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2014 : OriginalRow227TriangleForward2014.entries.size = 23 := rfl

def entry2014 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2014.entries[i.val]'(by rw [size2014]; exact i.isLt)

theorem fields2014 (i : Fin 23) :
    (entry2014 i).IA = shift ∧ (entry2014 i).ID = S (271 + i.val + 1) ∧
      (entry2014 i).IC = S 208 ∧ (entry2014 i).Inext = T 207 (271 + i.val + 1) ∧
      (entry2014 i).Icur = T 207 (271 + i.val) ∧
      (entry2014 i).output = T 208 (271 + i.val) ∧
      (entry2014 i).charge = charge 207 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow208.block2030_value ⟨22, by decide⟩).symm, rfl⟩

theorem step2014 (i : Fin 23) :
    forwardStepOK (-768) (charge 207 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 208) (T 207 (271 + i.val + 1))
      (T 207 (271 + i.val)) (T 208 (271 + i.val))
      (OriginalRow227Roots.root_pos 208 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 207 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2014.entries OriginalRow227TriangleForward2014.checked
    ⟨i.val, by rw [size2014]; exact i.isLt⟩
  change (entry2014 i).check = true at h
  rcases fields2014 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 207 ≤ d) (hhi : d < 294) :
    forwardStepOK (-768) (charge 207 d) shift (S (d + 1)) (S 208)
      (T 207 (d + 1)) (T 207 d) (T 208 d)
      (OriginalRow227Roots.root_pos 208 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 207 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    have hi : d - 207 < 32 := by omega
    have heq : 207 + (d - 207) = d := by omega
    simpa only [heq] using step2012 ⟨d - 207, hi⟩
  ·
    by_cases h271 : d < 271
    ·
      have hi : d - 239 < 32 := by omega
      have heq : 239 + (d - 239) = d := by omega
      simpa only [heq] using step2013 ⟨d - 239, hi⟩
    ·
      have hi : d - 271 < 23 := by omega
      have heq : 271 + (d - 271) = d := by omega
      simpa only [heq] using step2014 ⟨d - 271, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.fields2012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.step2012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.fields2013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.step2013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.fields2014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.step2014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow208
