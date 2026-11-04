import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213
import Grothe.UpperChaos.OriginalRow227TriangleForward2027
import Grothe.UpperChaos.OriginalRow227TriangleForward2028
import Grothe.UpperChaos.OriginalRow227TriangleForward2029

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2027 : OriginalRow227TriangleForward2027.entries.size = 32 := rfl

def entry2027 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2027.entries[i.val]'(by rw [size2027]; exact i.isLt)

theorem fields2027 (i : Fin 32) :
    (entry2027 i).IA = shift ∧ (entry2027 i).ID = S (212 + i.val + 1) ∧
      (entry2027 i).IC = S 213 ∧ (entry2027 i).Inext = T 212 (212 + i.val + 1) ∧
      (entry2027 i).Icur = T 212 (212 + i.val) ∧
      (entry2027 i).output = T 213 (212 + i.val) ∧
      (entry2027 i).charge = charge 212 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2027 (i : Fin 32) :
    forwardStepOK (-768) (charge 212 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 213) (T 212 (212 + i.val + 1))
      (T 212 (212 + i.val)) (T 213 (212 + i.val))
      (OriginalRow227Roots.root_pos 213 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 212 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2027.entries OriginalRow227TriangleForward2027.checked
    ⟨i.val, by rw [size2027]; exact i.isLt⟩
  change (entry2027 i).check = true at h
  rcases fields2027 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2028 : OriginalRow227TriangleForward2028.entries.size = 32 := rfl

def entry2028 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2028.entries[i.val]'(by rw [size2028]; exact i.isLt)

theorem fields2028 (i : Fin 32) :
    (entry2028 i).IA = shift ∧ (entry2028 i).ID = S (244 + i.val + 1) ∧
      (entry2028 i).IC = S 213 ∧ (entry2028 i).Inext = T 212 (244 + i.val + 1) ∧
      (entry2028 i).Icur = T 212 (244 + i.val) ∧
      (entry2028 i).output = T 213 (244 + i.val) ∧
      (entry2028 i).charge = charge 212 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2028 (i : Fin 32) :
    forwardStepOK (-768) (charge 212 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 213) (T 212 (244 + i.val + 1))
      (T 212 (244 + i.val)) (T 213 (244 + i.val))
      (OriginalRow227Roots.root_pos 213 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 212 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2028.entries OriginalRow227TriangleForward2028.checked
    ⟨i.val, by rw [size2028]; exact i.isLt⟩
  change (entry2028 i).check = true at h
  rcases fields2028 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2029 : OriginalRow227TriangleForward2029.entries.size = 13 := rfl

def entry2029 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2029.entries[i.val]'(by rw [size2029]; exact i.isLt)

theorem fields2029 (i : Fin 13) :
    (entry2029 i).IA = shift ∧ (entry2029 i).ID = S (276 + i.val + 1) ∧
      (entry2029 i).IC = S 213 ∧ (entry2029 i).Inext = T 212 (276 + i.val + 1) ∧
      (entry2029 i).Icur = T 212 (276 + i.val) ∧
      (entry2029 i).output = T 213 (276 + i.val) ∧
      (entry2029 i).charge = charge 212 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨12, by decide⟩).symm, rfl⟩

theorem step2029 (i : Fin 13) :
    forwardStepOK (-768) (charge 212 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 213) (T 212 (276 + i.val + 1))
      (T 212 (276 + i.val)) (T 213 (276 + i.val))
      (OriginalRow227Roots.root_pos 213 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 212 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2029.entries OriginalRow227TriangleForward2029.checked
    ⟨i.val, by rw [size2029]; exact i.isLt⟩
  change (entry2029 i).check = true at h
  rcases fields2029 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 212 ≤ d) (hhi : d < 289) :
    forwardStepOK (-768) (charge 212 d) shift (S (d + 1)) (S 213)
      (T 212 (d + 1)) (T 212 d) (T 213 d)
      (OriginalRow227Roots.root_pos 213 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 212 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    have hi : d - 212 < 32 := by omega
    have heq : 212 + (d - 212) = d := by omega
    simpa only [heq] using step2027 ⟨d - 212, hi⟩
  ·
    by_cases h276 : d < 276
    ·
      have hi : d - 244 < 32 := by omega
      have heq : 244 + (d - 244) = d := by omega
      simpa only [heq] using step2028 ⟨d - 244, hi⟩
    ·
      have hi : d - 276 < 13 := by omega
      have heq : 276 + (d - 276) = d := by omega
      simpa only [heq] using step2029 ⟨d - 276, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.fields2027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.step2027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.fields2028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.step2028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.fields2029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.step2029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow213
